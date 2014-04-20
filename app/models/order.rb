class Order < ActiveRecord::Base
  include AASM

  has_paper_trail

  has_many :user_tickets
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

  def amount=(val)
    write_attribute(:amount, val) if val
  end

  def ticket_science_fee=(val)
    write_attribute(:ticket_science_fee, val) if val
  end

  def total_cost_by_ticket(ticket_array,event)
    ticket = event.tickets.find_by ticket_type: ticket_array.first
    ticket_count(ticket_array) * ticket.price
  end

  def ticket_count(ticket_array)
    ticket_array.last.to_i
  end

  def price_before_fees_and_discounts
    # tickets = UserTicket.where(order_id = self).all
    tickets = UserTicket.find_all_by_order_id self
    array = tickets.collect do |ticket|
      ticket.ticket.price
    end
    a = array.inject(:+) unless array.size == 0
  end

  def total_fees
    fees = self.event.fees.collect do |fee|
      fee.amount
    end
    fee_per_ticket = fees.inject(:+) unless fees.size == 0
    fee_per_ticket * paid_ticket_count
  end

  def price_after_discount(price)
    price - self.total_discount(price)
  end

  def total_discount(price)
    return self.referral_code.discount_quantity if self.referral_code.discount_version == "flat_rate"
    return price * self.referral_code.discount_quantity / 100 if self.referral_code.discount_version == "percent"
  end

  def price_after_discount_before_fees
    if referral_code_submitted?
      self.price_after_discount(self.price_before_fees_and_discounts)
    else
      self.price_before_fees_and_discounts
    end
  end

  def total_charge
    price_after_discount_before_fees * 100 + self.ticket_science_fee + total_fees * 100
  end

  def free?
    self.price_before_fees_and_discounts == 0
  end

  def paid_order
    self.price_after_discount_before_fees == nil || self.price_after_discount_before_fees.to_i > 0
  end

  def paid_ticket_count
    tickets = self.user_tickets.collect do |user_ticket|
      user_ticket.ticket.free?
    end
    tickets.grep(false).size
  end

  def referral_code_submitted?
    self.referral_code != nil && self.referral_code.code != nil
  end

  def referral_code_type
    self.referral_code.discount_version
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
