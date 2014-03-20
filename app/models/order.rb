class Order < ActiveRecord::Base

  attr_accessor :stripe_user_created

  has_many :user_tickets
  belongs_to :referral_code
  belongs_to :event

  def price_before_fees_and_discounts
    array = self.user_tickets.collect do |user_ticket|
      user_ticket.ticket.price
    end
    array.inject(:+) unless array.size == 0
  end

  def total_fees
    fees = self.event.fees.collect do |fee|
      fee.amount
    end
    fee_per_ticket = fees.inject(:+) unless fees.size == 0
    fee_per_ticket * paid_ticket_count
  end

  def price_after_discount_before_fees
    if referral_code_submitted?
      self.referral_code.price_after_discount(price_before_fees_and_discounts)
    else
      price_before_fees_and_discounts
    end
  end

  def total_charge
    price_after_discount_before_fees + total_fees
  end

  def self.stripe_price(price)
      (price * 100).to_i
  end

  def free?
    self.price_before_fees_and_discounts == 0
  end

  def buyer_exists?
    self.paid_order && self.stripe_user_created
  end

  def paid_order
    self.price_after_discount_before_fees == nil || self.price_after_discount_before_fees.to_i > 0
  end

  def stripe_user_created
    @stripe_user_created || false
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
    self.referral_code.discount_type
  end

  def self.create_charge(amount, currency, customer, description, fee, user_access_token)
    begin
      charge = Stripe::Charge.create(
      {
        :amount => amount,
        :currency => currency,
        :customer => customer,
        :description => description,
        :application_fee => fee
      },
       user_access_token
      )
    rescue Stripe::CardError => e
      # The card has been declined
      binding.pry
    end
  end
  
end
