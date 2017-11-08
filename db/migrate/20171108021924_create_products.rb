class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :unit_price, null: false
      t.integer :stock, null: false
      t.timestamps
    end
  end
end
