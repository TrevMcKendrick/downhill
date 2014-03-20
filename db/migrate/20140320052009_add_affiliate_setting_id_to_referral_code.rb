class AddAffiliateSettingIdToReferralCode < ActiveRecord::Migration
  def change
    add_column :referral_codes, :affiliate_setting_id, :integer
  end
end
