class AddDeadlinePricingInfoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :deadline_pricing_info, :text
  end
end
