class AddPublishedToReferralCodes < ActiveRecord::Migration
  def change
    add_column :referral_codes, :published, :boolean
  end
end
