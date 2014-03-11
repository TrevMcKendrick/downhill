class AddQuantityToReferralCodes < ActiveRecord::Migration
  def change
    add_column :referral_codes, :quantity, :integer
  end
end
