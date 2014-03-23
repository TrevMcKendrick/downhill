class AddEventIdToReferralCode < ActiveRecord::Migration
  def change
    add_column :referral_codes, :event_id, :integer
  end
end
