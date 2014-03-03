class Event < ActiveRecord::Base
  has_many :user_events
  has_many :users, :through => :user_events

  has_many :tickets
  has_many :fees

  def calculate_ticket_charge(ticket_quantity_hash)
    create_ticket_total_array(ticket_quantity_hash).reduce(:+)
  end

  def create_ticket_total_array(ticket_quantity_hash)
    ticket_amounts = ticket_quantity_hash.collect do |ticket_quantity_pair|
      ticket = look_up_ticket(ticket_quantity_pair.first)
      quantity = ticket_quantity_pair.last.to_i
      (ticket.price * quantity).to_int
    end
  end

  def number_of_paid_tickets_purchased_this_transaction(ticket_quantity_hash)
    tickets = ticket_quantity_hash.collect do |ticket_quantity_pair|
      quantity = ticket_quantity_pair.last.to_i
    end
    tickets.reduce(:+)
  end

  def look_up_ticket(ticket_type)
    self.tickets.find_by ticket_type: ticket_type
  end
end