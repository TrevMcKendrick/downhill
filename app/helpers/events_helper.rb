module EventsHelper

  def wave_collection(waves)
    waves.collect do |wave|
    end
  end

  def card_expiration_year
    if Rails.env.development?
      2020
    else
      Date.today.year
    end
  end

  def page_not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def wave_titles
    array = Array.new
    @event.waves.each do |wave|
      array.push(["#{wave.title}" + " - " + "#{format_time(wave.start_time)}" + " - " "#{waves_remaining(wave)} remaining!",wave.id])
    end
    array
  end

  def waves_remaining(wave)
    wave.quantity - wave.users.count
  end

  def ticket_titles
    array = Array.new
    @event.tickets.each do |ticket|
      array.push(["#{ticket.ticket_type}" + " - " + "#{tickets_remaining(ticket)} remaining!",ticket.id])
    end
    array
  end

  def tickets_remaining(ticket)
    ticket.quantity - ticket.users.count
  end

end
