class OrdersController < ApplicationController
  layout "order"
  before_action :get_event_from_params, :find_user
  skip_before_action :check_subdomain, :only => [:success, :new, :create]

  def success
    @participant = session[:participant]
    @user = @event.users.where type: "User"
  end

  def new
    @ticket = @event.tickets.find_by ticket_type: params[:ticket]
    @referral_code = session[:referral_code]
  end

  def create
    @participant = @event.users.build(participant_params)
    @order = @event.orders.build(order_params)
    @order.stripe_token = params[:stripeToken]
    @order.add_buyer(@participant)

    if @order.buyer_added?
      @order.save!
      @team = @event.teams.find_or_create_by(name: params[:join_team]) if join_or_create_team == "join"
      @team = @event.teams.find_or_create_by(name: params[:create_team_name]) if join_or_create_team == "create"

      @wave = @event.waves.find_by id: wave_params[:id] if wave_params[:id]
      @ticket = @event.tickets.find_by ticket_type: params[:ticket][:ticket_type]
      @event.add_participant(@participant, @team, @wave, params[:waiver_signature], @ticket)
      @order.add_ticket(@ticket, @participant)
      @order.charge! unless @order.errored?
    end

    if @order.charged?
      sign_in(@order.participant)
      session[:participant] = @order.participant
      redirect_to success_order_path(@event)
      return false
    else
      redirect_to :back, alert: @order.error
      return false
    end
  end

  private

  def order_params
    params.require(:order).permit(:amount)
  end

  def ticket_params
    params.require(:order).permit(ticket: :ticket_type)
  end

  def participant_params
    params.require(:participant).permit(:email, :first_name, :shirtsize, :phone, :type, :password, :gender, :type)
  end

  def wave_params
    params.require(:wave).permit(:id)
  end

  def join_or_create_team
    if params[:team] == "Join Team"
      return "join"
    end

    if params[:team] == "Create Team" 
      return "create"
    end
  end

end