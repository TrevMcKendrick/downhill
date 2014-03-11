class AddReferralCodeIdToUserTickets < ActiveRecord::Migration
  def change
    add_column :user_tickets, :referral_code_id, :integer
  end
end
