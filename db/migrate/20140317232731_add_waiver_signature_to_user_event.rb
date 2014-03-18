class AddWaiverSignatureToUserEvent < ActiveRecord::Migration
  def change
    add_column :user_events, :waiver_signature, :string
  end
end
