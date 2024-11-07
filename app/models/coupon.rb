class Coupon < ApplicationRecord
    validates :title, uniqueness: true
end
