class RemoveColumnsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :paid, :boolean
    remove_column :orders, :buyer_id, :integer
  end
end
