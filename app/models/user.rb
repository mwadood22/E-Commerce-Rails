class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :products, dependent: :destroy
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, :email, :password, :avatar, presence: true
  
  after_create do
    customer = Stripe::Customer.create(email: email.to_s)
    update(stripe_customer_id: customer.id)
  end 
end
