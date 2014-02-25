class AddColumnToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :subdomain, :string
  end
end
