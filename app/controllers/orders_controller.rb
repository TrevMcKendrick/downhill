class OrdersController < ApplicationController
  layout "order"
  before_action :get_event_from_params, :find_user

  def new
    @tickets = params[:tickets].to_a
    @order = Order.new
    @participant = Participant.new
  end

  def create

    # ReferralCode.is_valid?(params[:referral_code], @event)

    @order = Order.new(:event => @event) #, :referral_code => @referral_code)
    @wave = Wave.find_by id: params[:wave]

    @event.tickets.each do |ticket|
      if at_least_one(ticket)
        params[ticket.ticket_type].first[:email].count.times do |i|
          @participant = Participant.create(
            :email => params[ticket.ticket_type].first[:email][i],
            :first_name => params[ticket.ticket_type].first[:name][i],
            :shirtsize => params[ticket.ticket_type].first[:shirtsize][i],
            :phone => params[ticket.ticket_type].first[:phone][i]
            )

          @order.save
          @event.users << @participant
          @wave.users << @participant
          ticket.users << @participant

          ticket.add_order(@order, @participant)
          setup_buyer unless @order.buyer_exists?
        end
      end
    end

    binding.pry
    @buyer.add_waiver_signature(params[:waiver_signature], @event)
    create_charge unless @order.free?
    redirect_to :back
  end

  private

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
      Order.stripe_price(@order.total_charge.to_i),
      "usd", 
      @stripe_user, 
      @buyer.email,
      Order.stripe_price(SWIFT_FEE * @order.paid_ticket_count),
      @user.stripe_access_token
      )
  end

end