class PagesController < ApplicationController
  skip_authorization_check
  layout "pages"

  def home
    cookies[:_cookietest_session] = {domain: COOKIE_DOMAIN}
  end

  def faq
  end
  
end
