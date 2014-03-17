class OrdersController < ApplicationController
  layout "order"
  before_action :get_event_from_params, :find_user

  def new
    @tickets = params[:tickets].to_a
    @order = Order.new
    @participant = Participant.new
  end

  def create
    @order = Order.create
    @event.tickets.each do |ticket|
      if params[ticket.ticket_type] != nil 
        params[ticket.ticket_type].first[:email].count.times do |i|
          @participant = Participant.create(:email => params[ticket.ticket_type].first[:email][i], :first_name => params[ticket.ticket_type].first[:name][i])
          @event.users << @participant
          UserTicket.create(:user => @participant, :ticket => ticket, :order => @order)
        end
      end
    end

  redirect_to :back
  end

  private

  def order_params

  end

  def number_of_tickets
    params[@event.tickets.first.ticket_type].first[:email].count
  end


end