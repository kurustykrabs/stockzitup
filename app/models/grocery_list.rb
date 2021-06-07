class GroceryList < ApplicationRecord
  belongs_to :user
  has_many :grocery_list_products
  has_many :products, through: :grocery_list_products
end
