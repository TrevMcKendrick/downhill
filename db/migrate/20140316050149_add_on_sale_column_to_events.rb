class AddOnSaleColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :on_sale, :boolean
  end
end
