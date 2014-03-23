class AddTypeToReferralCode < ActiveRecord::Migration
  def change
    add_column :referral_codes, :type, :string
  end
end
