class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.text :header
      t.text :footer

      t.timestamps
    end
  end
end
