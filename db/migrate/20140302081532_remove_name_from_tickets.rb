class RemoveNameFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :name, :string
  end
end
