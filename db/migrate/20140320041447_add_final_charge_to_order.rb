class AddFinalChargeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :final_charge, :decimal, :precision => 8, :scale => 2
  end
end
