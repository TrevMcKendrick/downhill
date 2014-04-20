class AddParticipantIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :participant_id, :integer
  end
end
