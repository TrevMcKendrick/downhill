class AddTotalChargeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :total_charge, :decimal, :precision => 8, :scale => 2
  end
end
