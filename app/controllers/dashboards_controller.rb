class DashboardsController < ApplicationController
  authorize_resource :class => false
  before_action :authenticate_user!, :check_subdomain

  def show
    @account = current_user.account
    @start = params[:start_day].to_i
    @end = params[:end_day].to_i
  end

  def not_found
    raise ActionController::RoutingError.new('User Not Found')
  end

end