class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :heading
      t.text :body 
      t.timestamps
    end
  end
end
