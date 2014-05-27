class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :campain_monitor_access_token, :string
    add_column :users, :campaign_monitor_refresh_token, :string
    add_column :users, :is_god, :boolean
  end
end
