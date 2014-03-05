class AddQuantityToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :published, :boolean
  end
end
