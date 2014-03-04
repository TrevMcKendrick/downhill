class ChangeReceiptTextName < ActiveRecord::Migration
  def change
    rename_column :events, :receipt_text, :receipt_html
  end
end
