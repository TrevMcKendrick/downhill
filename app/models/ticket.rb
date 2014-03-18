class Ticket < ActiveRecord::Base
  belongs_to :event

  has_many :user_tickets
  has_many :users, :through => :user_tickets

  def add_order(order, participant)
    user_ticket = participant.user_tickets.find_by ticket_id: self
    user_ticket.order = order
    user_ticket.save
  end

  def free?
    self.price == 0
  end
  
end
