class RenameTicketTypeToType < ActiveRecord::Migration
  def change
    rename_column :tickets, :ticket_type, :type
  end
end
