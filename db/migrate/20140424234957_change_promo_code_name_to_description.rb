class ChangePromoCodeNameToDescription < ActiveRecord::Migration
  def change
    remove_column :referral_codes, :name, :string
    add_column :referral_codes, :description, :string
  end
end
