class CreateUserTickets < ActiveRecord::Migration
  def change
    create_table :user_tickets do |t|
      t.integer :user_id
      t.integer :ticket_id

      t.timestamps
    end
  end
end
