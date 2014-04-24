class Order < ActiveRecord::Base
  include AASM

  has_paper_trail

  has_one :user_ticket
  belongs_to :referral_code
  belongs_to :event
  belongs_to :participant

  before_create :populate_guid, :add_ticket_science_fee


  aasm :column => "state" do
    state :pending, initial: true
    state :buyer_added
    state :charged
    state :errored

    event :making_stripe_buyer, after: :create_stripe_buyer do
      transitions from: :pending, to: :buyer_added
    end

    event :charge, after: :create_charge do
      transitions from: :buyer_added, to: :charged
    end

    event :fail do
      transitions from: [:pending, :charged, :buyer_added] ,to: :errored
    end
  end

  def create_stripe_buyer
    begin
      customer = Stripe::Customer.create(
        {
        :card => self.stripe_token,
        :description => "Description field" 
        },
        self.event.user.stripe_access_token
      )
      self.participant.stripe_participant_id = customer.id
      self.save
    rescue Stripe::CardError => e
      self.error = e.message
      self.fail
    end
  end

  def create_charge
    set_amount
    begin
      charge = Stripe::Charge.create(
      {
        :amount => self.amount,
        :currency => "usd",
        :customer => self.participant.stripe_participant_id,
        :description => self.participant.email,
        :application_fee => self.ticket_science_fee
      },
       self.event.user.stripe_access_token
      )

    rescue Stripe::CardError => e
      self.update_attributes(error: e.message)
      self.fail!
    end
    logger.info "Stripe charge is = #{charge.amount}"
    self.stripe_charge_id = charge.id
    self.stripe_balance_transaction_id = charge.balance_transaction
    self.save
  end

  def add_buyer(participant)
    self.participant = participant
    self.making_stripe_buyer
  end

  def add_ticket(ticket, participant)
    user_ticket = participant.user_tickets.find_by ticket_id: ticket
    user_ticket.order = self
    user_ticket.save
  end

  def set_amount
    self.amount = self.event.fee_total + self.user_ticket.ticket.price + TICKET_SCIENCE_FEE_TO_CUSTOMER
    logger.info "Fee total is = #{self.event.fee_total}"
    logger.info "Ticket price = #{self.user_ticket.ticket.price}"
    logger.info "TICKET_SCIENCE_FEE_TO_CUSTOMER = #{TICKET_SCIENCE_FEE_TO_CUSTOMER}"
  end

  private

  def populate_guid
    t = Time.now
    self.guid = SecureRandom.hex(2) + t.month.to_s + t.day.to_s + t.year.to_s[-2,2]
  end

  def add_ticket_science_fee
    self.ticket_science_fee = TICKET_SCIENCE_FEE
  end

  # def valid_referral_code?(string, current_event)
  #   code = ReferralCode.valid?(string)
  #   return nil if code == nil

  #   if code.promo_code?
  #     code.event == current_event ? code : nil
  #   end

  #   if code.affiliate_code?
  #     code.participant.events.include?(current_event) && current_event.affiliate_setting.enabled ? code : nil
  #   end
  # end
  
end
