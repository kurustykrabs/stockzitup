class GroceryList < ApplicationRecord
  belongs_to :user
  has_many :grocery_list_products, dependent: :destroy
  has_many :products, through: :grocery_list_products

  def subtotal
    grocery_list_products.collect { |grocery_list_product| grocery_list_product.valid? ? grocery_list_product.unit_price * grocery_list_product.quantity : 0 }.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end

end
