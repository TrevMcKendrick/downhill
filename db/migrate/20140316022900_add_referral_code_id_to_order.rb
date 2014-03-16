class AddReferralCodeIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :referral_code_id, :integer
  end
end
