class ChangeColumnInProducts < ActiveRecord::Migration[6.1]
  def up
    change_column :products, :price, :float, using: 'price::float'
  end

  def down
    change_column :products, :price, :decimal
  end

end
