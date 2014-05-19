class AddVolunteerInfoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :volunteer_info, :text
  end
end
