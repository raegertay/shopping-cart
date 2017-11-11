class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :product
      t.string :url, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
