class AddTicketScienceFeeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ticket_science_fee, :integer
  end
end
