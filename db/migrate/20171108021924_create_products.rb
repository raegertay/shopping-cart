class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :cost_price, null: false
      t.decimal :selling_price, null: false
      t.integer :stock, null: false
      t.string :image
      t.timestamps
    end
  end
end
