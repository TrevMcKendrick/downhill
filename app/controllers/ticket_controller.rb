class TicketController < ApplicationController
  before_action :authenticate_user!
  before_action :get_event_from_params, :only => [:create, :index]
  before_action :find_ticket, :only => [:edit, :update]

  def create
    @ticket = @event.tickets.build(ticket_params)
    
    respond_to do |format|
      if @ticket.save
        format.js { render :js => "window.location.href = '#{tickets_path}'" }
      else
        format.js
        # format.html { render 'new' }
      end
    end
  end

  def new
    @ticket = Ticket.new
  end

  def index
    @ticket = Ticket.new
    @tickets = @event.tickets
  end

  def edit
    @event = @ticket.event
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  private

  def find_ticket
    @ticket = Ticket.find_by id: params[:id]
  end

  def ticket_params
    params.require(:ticket).permit(
      :ticket_type,
      :price,
      :for_sale_begin,
      :for_sale_end,
      :quantity
      )
  end
  
end
