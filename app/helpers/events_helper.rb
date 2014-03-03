module EventsHelper
  def ticket_collection(tickets)
    array = Array.new
    (tickets + 1).times do |ticket|
      array.push([ticket.to_s, ticket])
    end
    array
  end

  def card_expiration_year
    if Rails.env.development?
      2020
    else
      Date.today.year
    end
  end
end
