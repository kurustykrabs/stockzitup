class GroceryListProduct < ApplicationRecord
  belongs_to :grocery_list
  belongs_to :product

  before_save :set_price
  before_save :set_total

  def price
    # If there is a record
    if persisted?
      self[:price]
    else
      product.price
    end
  end

  def total
    price * quantity
  end

  private

  def set_price
    self[:price] = price
  end

  def set_total
    self[:total] = total * quantity
  end
end
