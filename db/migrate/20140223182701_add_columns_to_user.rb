class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :password, :string
    add_column :users, :gender, :string
    add_column :users, :dob, :time
    add_column :users, :email, :string
    add_column :users, :shirtsize, :string
    add_column :users, :zipcode, :string
  end
end
