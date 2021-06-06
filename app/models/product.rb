class Product < ApplicationRecord
  belongs_to :category
  has_many :calculate_products
  has_many_attached :images, dependent: :destroy
  has_many :grocery_lists
end
