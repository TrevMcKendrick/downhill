class SettingsController < ApplicationController
  def index
    @settings = current_user.settings
  end

  def edit
  end
end
