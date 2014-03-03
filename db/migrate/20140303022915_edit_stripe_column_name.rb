class EditStripeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :stripe_token, :stripe_access_token
  end
end