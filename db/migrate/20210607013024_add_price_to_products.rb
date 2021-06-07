class AddPriceToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price, :decimal, precision: 7, scale: 2
  end
end
