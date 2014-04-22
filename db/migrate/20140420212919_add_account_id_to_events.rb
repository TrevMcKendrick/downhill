class AddAccountIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :account_id, :integer
  end
end
