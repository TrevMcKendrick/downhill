class AddAffiliateFeeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :affiliate_fee, :integer
  end
end
