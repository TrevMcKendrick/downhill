class EventsController < ApplicationController
  layout "event", only: [:show, :waiver]
  authorize_resource
  
  before_action :check_subdomain, :except => [:show]
  before_action :authenticate_user!, except: [:show]
  before_action :set_event, only: [:edit, :update, :destroy, :show, :waiver]  
  
  # skip_before_action :check_subdomain, :only => [:show]

  # GET /events
  # GET /events.json

  def waiver
  end

  def index
    @events = current_user.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @participant = Participant.new
    session[:referral_code] = params[:referral_code]
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
    @event = current_user.account.events.build(event_params)

    respond_to do |format|
      if @event.save
        @event.users << current_user
        format.js { render :js => "window.location.href = '#{edit_event_url(@event)}'" }
      else
        format.js
        format.html { render 'new' }
      end
    end

  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event.user.account.update(account_params)
    
    if @event.update(event_params)
      redirect_to :back
    else
      redirect_to dashboard_path
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
      @user = find_user
      @event = @user.events.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(
        :title, 
        :waiver, 
        :description, 
        :time, 
        :path, 
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
        :published,
        :on_sale,
        :about,
        :packet_info,
        :deadline_pricing_info,
        :volunteer_info,
        :charity_info
        )
    end

    def ticket_params
      params.require(:event).permit(ticket: [{:ticket_type => [], :price => [], :for_sale_begin => [], :for_sale_end => [] }])
    end

    def account_params
      params.require(:event).permit(account:[:header,:footer])
    end

    def wave_params
      params.require(:event).permit(wave: [{:start_time => [], :title => [], :quantity => [] }])
    end

    def fee_params
      params.require(:event).permit(fee: [{:name => [], :amount => [] }])
    end


end