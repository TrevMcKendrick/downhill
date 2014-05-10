class DropAmountFromReferralCodes < ActiveRecord::Migration
  def change
    remove_column :referral_codes, :amount, :decimal
  end
end
