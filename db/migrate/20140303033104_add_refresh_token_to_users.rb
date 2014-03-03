class AddRefreshTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_refresh_token, :string
  end
end
