class AddOmniauthToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :provider, :string
    add_column :customers, :uid, :string
  end
end
