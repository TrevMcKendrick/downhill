class RemoveAffiliateSettingFromReferralCode < ActiveRecord::Migration
  def change
    remove_column :referral_codes, :affiliate_setting_id, :integer
  end
end
