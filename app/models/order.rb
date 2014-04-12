class Order < ActiveRecord::Base
  has_paper_trail

  has_many :user_tickets
  belongs_to :referral_code
  belongs_to :event
  belongs_to :buyer, :class_name => "Participant", :foreign_key => "buyer_id"

  before_create :populate_guid

  def amount=(val)
    write_attribute(:amount, val) if val
  end

  def ticket_science_fee=(val)
    write_attribute(:ticket_science_fee, val) if val
  end

  def create_charge(stripe_user_id, user_access_token)
    begin
      charge = Stripe::Charge.create(
      {
        :amount => self.amount,
        :currency => "usd",
        :customer => stripe_user_id,
        :description => self.buyer.email,
        :application_fee => self.ticket_science_fee
      },
       user_access_token
      )
    rescue Stripe::CardError => e
      # The card has been declined
      binding.pry
    end
    # self.stripe_charge_id = charge.id
    # self.stripe_balance_transaction_id = charge.balance_transaction
    # self.save
  end

  def save_stripe_data(charge)
    
  end

  def total_cost_by_ticket(ticket_array,event)
    ticket = event.tickets.find_by ticket_type: ticket_array.first
    ticket_count(ticket_array) * ticket.price
  end

  def ticket_count(ticket_array)
    ticket_array.last.to_i
  end

  def add_ticket(ticket, participant)
    user_ticket = participant.user_tickets.find_by ticket_id: ticket
    user_ticket.order = self
    user_ticket.save
  end

  def price_before_fees_and_discounts
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
    price_after_discount_before_fees + total_fees + ticket_science_fee
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
  
end
