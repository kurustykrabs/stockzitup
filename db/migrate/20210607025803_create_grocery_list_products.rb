class CreateGroceryListProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :grocery_list_products do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key:true
      t.references :grocery_list, null: false, foreign_key:true
      t.decimal :total, default: "0.0"
      t.decimal :unit_price, default: "0.0"
      t.timestamps
    end
  end
end
