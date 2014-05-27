class PagesController < ApplicationController
  skip_authorization_check
  layout "pages"

  def home
    cookies[:_cookietest_session] = {domain: COOKIE_DOMAIN}
    if current_user.present?
      redirect_to dashboard_url
    end
  end

  def faq
  end

end
