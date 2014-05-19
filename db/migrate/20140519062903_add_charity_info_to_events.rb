class AddCharityInfoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :charity_info, :text
  end
end
