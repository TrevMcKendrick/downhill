class DropColumnsFromReferralCode < ActiveRecord::Migration
  def change
    remove_column :referral_codes, :codeable_type, :string
    remove_column :referral_codes, :codeable_id, :integer
  end
end
