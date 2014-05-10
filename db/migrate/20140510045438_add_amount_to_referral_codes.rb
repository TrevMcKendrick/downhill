class AddAmountToReferralCodes < ActiveRecord::Migration
  def change
    add_column :referral_codes, :amount, :integer
  end
end
