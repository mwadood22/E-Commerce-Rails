class Product < ApplicationRecord
    validates :title, :category_id, :description, :price, :images, presence: true
    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories, dependent: :destroy
    has_many :variants, class_name: 'ProductVariant', dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :items, class_name: 'OrderItem', dependent: :destroy
    has_many_attached :images, dependent: :destroy
    validates :price, numericality: { greater_than: 0 }
end
