class AddErrorToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :error, :text
  end
end
