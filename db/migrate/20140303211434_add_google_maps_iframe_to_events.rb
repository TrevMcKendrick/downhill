class AddGoogleMapsIframeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :google_maps_iframe, :text, :limit => nil
  end
end
