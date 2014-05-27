class CampaignMonitorsController < ApplicationController
  before_filter :bring_god, :try_token

  

  private

  def bring_god
      @god = User.find_by is_god: true
  end

  def auth
    {
      :access_token => @god.campain_monitor_access_token,
      :refresh_token => @god.campaign_monitor_refresh_token
    }
  end

  def save_token(access_token, refresh_token)
    @god.campain_monitor_access_token = access_token
    @god.campaign_monitor_refresh_token = refresh_token
  end

  def try_token
    begin
      tries ||= 2
      cs = CreateSend::CreateSend.new auth
      clients = cs.clients
      rescue CreateSend::ExpiredOAuthToken => eot
        save_token(access_token, refresh_token)
        access_token, expires_in, refresh_token = cs.refresh_token
        retry unless (tries -= 1).zero?
      rescue Exception => e
      end
  end
end
