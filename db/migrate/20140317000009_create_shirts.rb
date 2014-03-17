class CreateShirts < ActiveRecord::Migration
  def change
    create_table :shirts do |t|
      t.string :size

      t.timestamps
    end
  end
end
