class CreateGroceryLists < ActiveRecord::Migration[6.1]
  def change
    create_table :grocery_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :date
      t.decimal :subtotal, default: "0.0"
      t.decimal :total, default: "0.0"
      t.timestamps
    end
  end
end
