class RemoveTimeColumnFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :time, :string
  end
end
