class OrdersController < ApplicationController
  layout "order"
  before_action :get_event_from_params, :find_user

<<<<<<< HEAD
  def success
    @participant = session[:participant]
    @user = @event.users.where type: "User"
  end

  def new
    @tickets = params[:tickets].to_a
    @referral_code = session[:referral_code]
=======
  def new
    @tickets = params[:tickets].to_a
>>>>>>> c3ad34dae9994bfd1fdcf2ee562b67ac99b1d568
    @order = Order.new
    @participant = Participant.new
  end

  def create
<<<<<<< HEAD
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

          setup_buyer unless @order.buyer_exists?
        end
      end
    end
    
    @order.final_charge = @order.total_charge
    @order.save

    @buyer.add_waiver_signature(params[:waiver_signature], @event)

    create_charge unless @order.free?
    # redirect_to :back
    sign_in(@buyer)
    session[:participant] = @buyer
    redirect_to success_order_path(@event)
=======
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
>>>>>>> c3ad34dae9994bfd1fdcf2ee562b67ac99b1d568
  end

  private

<<<<<<< HEAD
  def at_least_one(ticket)
    params[ticket.ticket_type] != nil
  end

  def setup_buyer
    @buyer = @participant
    @stripe_user = Participant.create_stripe_user(params[:stripeToken], @buyer.email, @user.stripe_access_token)
    @buyer.stripe_participant_id = @stripe_user.id
    @order.stripe_user_created = true
    @buyer.save
  end

  def create_charge
    Order.create_charge(
      Order.stripe_price(@order.final_charge.to_i),
      "usd", 
      @stripe_user, 
      @buyer.email,
      Order.stripe_price(SWIFT_FEE * @order.paid_ticket_count),
      @user.stripe_access_token
      )
  end

  def join_or_create_team
    
    if params[:team] == "Join Team"
      return "join"
    end

    if params[:team] == "Create Team" 
      return "create"
    end
  end
=======
  def order_params

  end

  def number_of_tickets
    params[@event.tickets.first.ticket_type].first[:email].count
  end

>>>>>>> c3ad34dae9994bfd1fdcf2ee562b67ac99b1d568

end