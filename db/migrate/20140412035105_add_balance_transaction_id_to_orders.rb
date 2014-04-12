class AddBalanceTransactionIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :stripe_balance_transaction_id, :string
  end
end
