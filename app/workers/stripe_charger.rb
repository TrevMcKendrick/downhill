class StripeCharger
  include Sidekiq::Worker

  # def perform(guid, stripe_user_id, user_access_token)
  #     order = Order.find_by(guid: guid)
  #     return unless order
  #     order.create_charge(stripe_user_id, user_access_token)
  # end

  def perform(guid, stripe_user_id, user_access_token)
      ActiveRecord::Base.connection_pool.with_connection do
        order = Order.find_by(guid: guid)
        begin
          charge = Stripe::Charge.create(
          {
          :amount => order.amount,
          :currency => "usd",
          :customer => stripe_user_id,
          :description => order.buyer.email,
          :application_fee => order.ticket_science_fee
          },
          user_access_token)
          order.stripe_charge_id = charge.id
          order.stripe_balance_transaction_id = charge.balance_transaction
          order.save!
        rescue Stripe::Error => e
          binding.pry
          #didn't work
        end
      end

  end
end