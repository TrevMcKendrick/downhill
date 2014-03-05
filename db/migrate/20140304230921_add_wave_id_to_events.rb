class AddWaveIdToEvents < ActiveRecord::Migration
  def change
    add_column :waves, :event_id, :integer
  end
end
