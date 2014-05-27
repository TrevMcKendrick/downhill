Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stripe_connect, STRIPE_CLIENT_ID, Stripe.api_key, :scope => 'read_write'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider "createsend", CAMPAIGN_MONITOR_CLIENT_ID, CAMPAIGN_MONITOR_CLIENT_SECRET, :scope => 'ViewReports,CreateCampaigns,SendCampaigns'
end
