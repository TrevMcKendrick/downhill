class RemoveWaiverSignedFromUserEvents < ActiveRecord::Migration
  def change
    remove_column :user_events, :waiver_signed, :string
  end
end
