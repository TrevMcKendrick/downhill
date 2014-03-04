class AddReceiptTextToEvents < ActiveRecord::Migration
  def change
    add_column :events, :receipt_text, :text
  end
end
