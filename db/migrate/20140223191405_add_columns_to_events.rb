class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :title, :string
    add_column :events, :time, :date
    add_column :events, :waiver, :string
  end
end
