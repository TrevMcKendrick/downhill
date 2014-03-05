class CreateUserWaves < ActiveRecord::Migration
  def change
    create_table :user_waves do |t|
      t.integer :wave_id
      t.integer :user_id

      t.timestamps
    end
  end
end
