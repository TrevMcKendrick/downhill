class DashboardsController < ApplicationController
  authorize_resource :class => false
  before_action :authenticate_user!, :check_subdomain

  def show 
    @user = current_user
  end

  def not_found
    raise ActionController::RoutingError.new('User Not Found')
  end
end