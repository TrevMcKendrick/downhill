class RemoveColumnsFromReferralCodes < ActiveRecord::Migration
  def change
    remove_column :referral_codes, :event_id, :integer
    remove_column :referral_codes, :user_id, :integer
  end
end
