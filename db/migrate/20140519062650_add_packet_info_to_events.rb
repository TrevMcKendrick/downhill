class AddPacketInfoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :packet_info, :text
  end
end
