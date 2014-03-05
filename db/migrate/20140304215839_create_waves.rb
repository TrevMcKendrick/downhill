class CreateWaves < ActiveRecord::Migration
  def change
    create_table :waves do |t|
      t.time :start_time
      t.integer :quantity
      t.string :title

      t.timestamps
    end
  end
end
