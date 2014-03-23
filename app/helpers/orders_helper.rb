module OrdersHelper
  def ticket(ticket_array)
    ticket = @event.tickets.find_by ticket_type: ticket_array.first
  end

  def ticket_price(ticket_array)
    ticket(ticket_array).price
  end

  def ticket_type(ticket_array)
    ticket(ticket_array).ticket_type
  end

  def ticket_free?(ticket_array)
     ticket(ticket_array).free?
  end
end
