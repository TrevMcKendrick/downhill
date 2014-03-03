Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stripe_connect, STRIPE_CLIENT_ID, Stripe.api_key, :scope => 'read_write'
end