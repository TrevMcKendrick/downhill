class AddParticipantIdToReferralCode < ActiveRecord::Migration
  def change
    add_column :referral_codes, :participant_id, :integer
  end
end
