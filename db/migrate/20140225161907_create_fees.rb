class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.string :name
      t.integer :event_id
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
