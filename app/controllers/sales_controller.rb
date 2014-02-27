class SalesController < ApplicationController
  before_action :find_event, :authenticate_user!

  def show
  end

  private 

  def find_event
    @user = find_user
    events = @user.events
    @event = events.where(:path => params[:path]).first
  end

  def find_user
    User.where(:subdomain => "trevor").first
  end

end
