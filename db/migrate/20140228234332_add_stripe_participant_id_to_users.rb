class AddStripeParticipantIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_participant_id, :string
  end
end
