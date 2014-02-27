class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /events
  # GET /events.json
  def index
    @events = current_user.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    @ticket_names = ticket_params[:ticket][:name]
    @ticket_prices = ticket_params[:ticket][:price]
    @ticket_for_sale_begins = ticket_params[:ticket][:for_sale_begin]
    @ticket_for_sale_ends = ticket_params[:ticket][:for_sale_end]

    (0...(@ticket_names.count - 1)).each do |index|
      @event.tickets.build(
        :name => @ticket_names[index],
        :price => @ticket_prices[index],
        :for_sale_begin => @ticket_for_sale_begins[index],
        :for_sale_end => @ticket_for_sale_ends[index]
        )
    end

    @fee_names = fee_params[:fee][:name]
    @fee_amounts = fee_params[:fee][:amount]

    (0...(@fee_names.count - 1)).each do |index|
      @event.fees.build(
        :name => @fee_names[index],
        :amount => @fee_amounts[index]
        )
    end

    
    respond_to do |format|
      if @event.save
        @event.users << current_user
        format.html { redirect_to @event, alert: 'Event was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_event
      @event = current_user.events.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :waiver, :description, :time)
    end

    def ticket_params
      params.require(:event).permit(ticket: [{:name => [], :price => [], :for_sale_begin => [], :for_sale_end => [] }])
    end

    def fee_params
      params.require(:event).permit(fee: [{:name => [], :amount => [] }])
    end
end