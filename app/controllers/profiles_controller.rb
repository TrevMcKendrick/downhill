class ProfilesController < ApplicationController
  before_action :authenticate_user!
  layout "profile"

  def show 
    @user = current_user
  end

  def not_found
    raise ActionController::RoutingError.new('User Not Found')
  end
end
