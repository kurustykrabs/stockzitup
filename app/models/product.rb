class Product < ApplicationRecord
  belongs_to :category
  has_many :grocery_list_products
  has_many_attached :images, dependent: :destroy
  has_many :grocery_lists, through: :grocery_list_products
end
