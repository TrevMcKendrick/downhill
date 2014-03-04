class AddAddressColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :street_address_one, :string
    add_column :events, :street_address_two, :string
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :zipcode, :string
  end
end
