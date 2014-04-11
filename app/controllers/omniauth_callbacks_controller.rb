class OmniauthCallbacksController < ApplicationController

  def authorize_stripe
    logger.debug "authorize_stripe called"
    code = params[:code]
    user = ActiveSupport::JSON.decode(`curl -X POST https://connect.stripe.com/oauth/token -d client_secret=#{Stripe.api_key} -d code=#{code} -d grant_type=authorization_code`)
    binding.pry
    set_user_stripe_attributes(user)

    redirect_to subdomain_with_https_or_http(DOMAIN_NAME, current_user.subdomain, settings_path)
    logger.debug "redirected to #{subdomain_with_https_or_http(DOMAIN_NAME, current_user.subdomain, settings_path)}"
  end

  private

  def set_user_stripe_attributes(user_attributes_hash)
    logger.debug "set_user_stripe_attributes called. user_attributes_hash.stripe_user_id = #{user_attributes_hash["stripe_user_id"]}"
    current_user.stripe_user_id = user_attributes_hash["stripe_user_id"]
    current_user.stripe_publishable_key = user_attributes_hash["stripe_publishable_key"]
    current_user.stripe_access_token = user_attributes_hash["access_token"]
    current_user.stripe_refresh_token = user_attributes_hash["refresh_token"]
    current_user.save
  end

end