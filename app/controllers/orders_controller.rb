class OrdersController < ApplicationController
  layout "order"
  before_action :get_event_from_params, :find_user
  skip_before_action :check_subdomain, :only => [:success, :new, :create]

  def success
    @participant = session[:participant]
    users = @event.users.where type: "User"
    @user = users.first
  end

  def new
    @ticket = @event.tickets.find_by ticket_type: params[:ticket]
    @referral_code = session[:referral_code]
    gon.price = ((@ticket.price + @event.fee_total + TICKET_SCIENCE_FEE_TO_CUSTOMER * 100) / 100.000).to_s
  end

  def create
    @participant = @event.users.build(participant_params)
    @order = @event.orders.build(order_params)
    @order.referral_code = ReferralCode.find_by code: (params[:order][:referral_code]) if @event.code_is_valid?(params[:order][:referral_code])
    @order.stripe_token = params[:stripeToken]
    @order.add_buyer(@participant)

    if @order.buyer_added?
      @team = @event.teams.find_or_create_by(name: params[:join_team]) if join_or_create_team == "join"
      @team = @event.teams.find_or_create_by(name: params[:create_team_name]) if join_or_create_team == "create"
      @wave = @event.waves.find_by id: wave_params[:id] if wave_params[:id]
      @ticket = @event.tickets.find_by ticket_type: params[:ticket][:ticket_type]
      @event.add_participant(@participant, @team, @wave, params[:waiver_signature], @ticket)
      @order.add_ticket(@ticket, @participant)
      @order.charge! unless @order.errored?
    end

    if @order.charged?
      @order.affiliate_fee = @order.referral_code.amount if @order.referral_code.present?
      @order.save
      session[:participant] = @order.participant
      redirect_to success_order_path(@event)
      return false
    else
      @order.fail!
      redirect_to :back, {:flash => { :error => "Order didn't go through!" }}
      return false
    end
  end

  def validate_referral_code
    test_code = params[:code]
    is_valid = @event.valid_codes.any? { |code| code.code == test_code }
    send_referral_code_to_client(is_valid)
  end

  def get_code_amount(string)
    @event.valid_codes.select { |code| code.code == string }.first.amount
  end

  def send_referral_code_to_client(is_valid)
    if is_valid
      response = get_code_amount(params[:code])
    else 
      response = nil
    end
      respond_to do |format|
        format.json { render :json => response }
      end
  end

  def validate_email_uniqueness
    @user = User.find_by_email(params[:participant][:email])
    respond_to do |format|
      format.json { render :json => !@user }
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
    if params[:create_team_name].present?
      return "create"
    end

    if params[:join_team].present?
      return "join"
    end
  end

end