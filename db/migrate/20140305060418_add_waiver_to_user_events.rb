class AddWaiverToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :waiver_signed, :boolean
  end
end
