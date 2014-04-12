class RemoveFinalChargeFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :final_charge, :string
  end
end
