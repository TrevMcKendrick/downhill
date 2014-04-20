class RemoveBuyerIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :participant_id, :integer
  end
end
