class AddDiscountTypeToReferralCodes < ActiveRecord::Migration
  def change
    add_column :referral_codes, :discount_type, :string
    add_column :referral_codes, :amount, :decimal, :precision => 8, :scale => 2
  end
end
