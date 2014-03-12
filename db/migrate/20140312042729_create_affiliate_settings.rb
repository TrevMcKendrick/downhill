class CreateAffiliateSettings < ActiveRecord::Migration
  def change
    create_table :affiliate_settings do |t|
      t.string :discount_type
      t.string :reward_type
      t.integer :event_id
      t.boolean :enabled
    end
  end
end
