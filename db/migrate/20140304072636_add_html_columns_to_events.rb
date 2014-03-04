class AddHtmlColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :race_day_info_html, :text
    add_column :events, :packet_pickup_info_html, :text
  end
end
