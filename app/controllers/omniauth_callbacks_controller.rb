class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def stripe_connect
    stripe_attributes = request.env['omniauth.auth']

    give_user_stripe(stripe_attributes)
    
    redirect_to settings_url
  end

  def give_user_stripe(stripe_attributes)
    current_user.stripe_user_id = stripe_attributes[:uid]
    current_user.stripe_publishable_key = stripe_attributes[:info][:stripe_publishable_key]
    current_user.stripe_token = stripe_attributes[:credentials][:token]
    current_user.save
  end

end