class GroceryListProduct < ApplicationRecord
  belongs_to :grocery_list 
  belongs_to :product
end
