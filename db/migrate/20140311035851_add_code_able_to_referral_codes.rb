class AddCodeAbleToReferralCodes < ActiveRecord::Migration
  def change
    add_column :referral_codes, :codeable_id, :integer
    add_column :referral_codes, :codeable_type, :string
  end
end
