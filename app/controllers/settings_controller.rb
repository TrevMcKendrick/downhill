class SettingsController < ApplicationController
  before_action :authenticate_user!, :check_subdomain

  def index
    @user = current_user
  end

  def update
    @user = current_user
    user.settings(:subdomain).text = params[:subdomain]
  end
end


private

  def settings_params
      params.require(:settings).permit(:subdomain)
  end