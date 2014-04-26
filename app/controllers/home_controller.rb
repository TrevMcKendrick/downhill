class HomeController < ApplicationController
  skip_authorization_check
  layout "home"

  def index
    cookies[:_cookietest_session] = {domain: COOKIE_DOMAIN}
  end
  
end
