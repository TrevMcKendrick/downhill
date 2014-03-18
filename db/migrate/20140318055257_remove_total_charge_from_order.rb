class RemoveTotalChargeFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :total_charge, :string
  end
end
