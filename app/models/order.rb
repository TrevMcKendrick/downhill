class Order < ActiveRecord::Base

  attr_accessor :stripe_user_created

  has_many :user_tickets
  belongs_to :referral_code

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

  def self.stripe_price(price)
      (price * 100).to_i
  end

  def stripe_user_created
    @stripe_user_created || false
  end
end
