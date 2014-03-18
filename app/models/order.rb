class Order < ActiveRecord::Base

  attr_accessor :stripe_user_created
  after_initialize :set_total_charge

  has_many :user_tickets
  belongs_to :referral_code
  belongs_to :event

  def self.stripe_price(price)
      (price * 100).to_i
  end

  def free?
    self.total_charge == 0
  end

  def set_total_charge
    self.total_charge = 0
  end

  def buyer_exists?
    self.paid_order && self.stripe_user_created
  end

  def paid_order
    self.total_charge > 0
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
