class AddOrderIdToUserTicket < ActiveRecord::Migration
  def change
    add_column :user_tickets, :order_id, :integer
  end
end
