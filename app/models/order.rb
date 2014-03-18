class Order < ActiveRecord::Base

  attr_accessor :stripe_user_created

  has_many :user_tickets
  belongs_to :referral_code
  belongs_to :event

  def total_price
    binding.pry
    array = self.user_tickets.collect do |user_ticket|
      user_ticket.ticket.price
    end
    array.inject(:+) unless array.size == 0
  end

  def total_charge
    if referral_code_submitted?
      flat_rate_discount if referral_code_type == "flat_rate"
      percent_discount if referral_code_type == "percent"
    else
      total_price
    end
  end

  def percent_discount
    total_price * (1 - self.referral_code.amount / 100)
  end

  def flat_rate_discount
    total_price - self.referral_code.amount
  end

  def self.stripe_price(price)
      (price * 100).to_i
  end

  def free?
    self.total_price == 0
  end

  def buyer_exists?
    self.paid_order && self.stripe_user_created
  end

  def paid_order
    self.total_charge == nil || self.total_charge > 0
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
