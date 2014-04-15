class OrdersController < ApplicationController
  layout "order"
  before_action :get_event_from_params, :find_user
  skip_before_action :check_subdomain, :only => [:success, :new, :create]

  def success
    @participant = session[:participant]
    @user = @event.users.where type: "User"
  end

  def new
    @tickets = params[:tickets].to_a
    @referral_code = session[:referral_code]
    @order = Order.new
    @participant = Participant.new
  end

  def create
    code = valid_referral_code?(params[:referral_code], @event)

    @order = Order.new(:event => @event, :referral_code => code)
    @wave = Wave.find_by id: params[:wave]

    @event.tickets.each do |ticket|
      if at_least_one(ticket)
        params[ticket.ticket_type].first[:email].count.times do |i|
          @participant = @event.users.create(
            :email => params[ticket.ticket_type].first[:email][i],
            :first_name => params[ticket.ticket_type].first[:name][i],
            :shirtsize => params[ticket.ticket_type].first[:shirtsize][i],
            :phone => params[ticket.ticket_type].first[:phone][i],
            :type => "Participant",
            :password => params[ticket.ticket_type].first[:password][i]
            )

          @team = @event.teams.find_or_create_by(name: params[:join_team]) if join_or_create_team == "join"
          @team = @event.teams.find_or_create_by(name: params[:create_team_name]) if join_or_create_team == "create"

          @participant.teams << @team if @team
          @wave.users << @participant
          ticket.users << @participant
          @participant.assign_affiliate_code(@event).save

          @order.add_ticket(ticket, @participant)

          setup_buyer unless @order.buyer
        end
      end
    end
    
    @order.ticket_science_fee = TICKET_SCIENCE_FEE * @order.paid_ticket_count
    @order.amount = @order.total_charge
    
    
    if @order.save && @order.free? == false
      @order.create_charge(@stripe_user, @user.stripe_access_token)
      # StripeCharger.perform_async(@order.guid, @stripe_user.id, @user.stripe_access_token)
    end

    @order.buyer.add_waiver_signature(params[:waiver_signature], @event)

    # redirect_to :back
    sign_in(@order.buyer)
    session[:participant] = @order.buyer
    redirect_to success_order_path(@event)
  end

  private

  def at_least_one(ticket)
    params[ticket.ticket_type] != nil
  end

  def setup_buyer
    @stripe_user = Participant.create_stripe_user(params[:stripeToken], @participant.email, @user.stripe_access_token)
    @participant.stripe_participant_id = @stripe_user.id
    @order.buyer = @participant
    @order.save
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