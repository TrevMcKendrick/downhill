class AddAmountToAffiliateSetting < ActiveRecord::Migration
  def change
    add_column :affiliate_settings, :amount, :decimal, :precision => 8, :scale => 2
  end
end
