class RemoveReferralCodeIdFromUserTickets < ActiveRecord::Migration
  def change
    remove_column :user_tickets, :referral_code_id, :integer
  end
end
