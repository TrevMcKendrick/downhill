class StripeCharger
  include Sidekiq::Worker

  def perform(guid, stripe_user_id, user_access_token)
      order = Order.find_by(guid: guid)
      return unless order
      order.create_charge(stripe_user_id, user_access_token)
  end
end