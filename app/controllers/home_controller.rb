class HomeController < ApplicationController
  layout "home"

  def index
    cookies[:_cookietest_session] = {domain: COOKIE_DOMAIN}
  end
  
end
