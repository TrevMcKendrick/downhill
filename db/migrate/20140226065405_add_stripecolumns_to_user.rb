class AddStripecolumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :stripe_user_id, :string
    add_column :users, :stripe_publishable_key, :string
    add_column :users, :stripe_token, :string
  end
end
