class AddEmailsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :volunteer_coordinator_email, :string
    add_column :events, :support_email, :string
  end
end
