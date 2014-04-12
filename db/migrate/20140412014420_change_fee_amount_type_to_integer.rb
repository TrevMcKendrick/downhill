class ChangeFeeAmountTypeToInteger < ActiveRecord::Migration
  def change
    change_column :fees, :amount,  :integer
  end
end
