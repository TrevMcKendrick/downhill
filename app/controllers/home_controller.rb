class HomeController < ApplicationController
  layout "home"

  def index
    cookies[:_cookietest_session] = {domain: '.lvh.me'}
  end

end
