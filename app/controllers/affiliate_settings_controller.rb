class AffiliateSettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_event_from_params, :only => [:index]
  before_action :find_affiliate_setting, :only => [:update]

  def index
    @affiliate_setting = @event.affiliate_setting
  end

  def update
    if @affiliate_setting.update(affiliate_setting_params)
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  private 

  def affiliate_setting_params
    params.require(:affiliate_setting).permit(
      :enabled,
      :discount_type,
      :reward_type,
      :amount
      )
  end

  def find_affiliate_setting
    @affiliate_setting = AffiliateSetting.find_by id: params[:id]
  end
end