class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :set_public_event, only: [:show]

  # GET /events
  # GET /events.json
  def index
    @events = current_user.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @participant = Participant.new
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

    @ticket_types = ticket_params[:ticket][:ticket_type]
    @ticket_prices = ticket_params[:ticket][:price]
    @ticket_for_sale_begins = ticket_params[:ticket][:for_sale_begin]
    @ticket_for_sale_ends = ticket_params[:ticket][:for_sale_end]

    (0...(@ticket_types.count - 1)).each do |index|
      @event.tickets.build(
        :ticket_type => @ticket_types[index],
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

    @wave_start_times = wave_params[:wave][:start_time]
    @wave_titles = wave_params[:wave][:title]
    @wave_quantities = wave_params[:wave][:quantity]

    (0...(@wave_start_times.count - 1)).each do |index|
      @event.waves.build(
        :start_time => @wave_start_times[index],
        :title => @wave_titles[index],
        :quantity => @wave_quantities[index],
        )
    end

    
    respond_to do |format|
      if @event.save
        @event.users << current_user
        format.html { redirect_to profile_path, alert: 'Event was successfully created.' }
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
        format.html { redirect_to profile_path, alert: 'Event was successfully created.' }
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
      format.html { redirect_to profile_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_event
      @event = current_user.events.find(params[:id])
    end

    def set_public_event
      @user = find_user
      events = @user.events
      @event = events.where(:path => params[:path]).first
    end

    def find_user
      User.where(:subdomain => request.subdomain).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(
        :title, 
        :waiver, 
        :description, 
        :time, :path, 
        :id, 
        :street_address_one, 
        :street_address_two, 
        :city, 
        :state, 
        :zipcode, 
        :date, 
        :timezone, 
        :volunteer_coordinator_email, 
        :support_email, 
        :google_maps_iframe, 
        :receipt_html,
        :packet_pickup_info_html,
        :race_day_info_html,
        :published
        )
    end

    def ticket_params
      params.require(:event).permit(ticket: [{:ticket_type => [], :price => [], :for_sale_begin => [], :for_sale_end => [] }])
    end

    def wave_params
      params.require(:event).permit(wave: [{:start_time => [], :title => [], :quantity => [] }])
    end

    def fee_params
      params.require(:event).permit(fee: [{:name => [], :amount => [] }])
    end


end