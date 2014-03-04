class AddTimeZoneToEvents < ActiveRecord::Migration
  def change
    add_column :events, :timezone, :string
  end
end
