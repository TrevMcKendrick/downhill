class AddPathToEvents < ActiveRecord::Migration
  def change
    add_column :events, :path, :string
    add_column :events, :live, :boolean
  end
end
