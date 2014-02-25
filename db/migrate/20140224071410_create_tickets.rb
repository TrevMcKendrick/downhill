class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.date :for_sale_begin
      t.date :for_sale_end
      t.integer :quantity

      t.timestamps
    end
  end
end
