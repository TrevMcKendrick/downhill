class WavesController < ApplicationController
  before_action :authenticate_user!, :check_subdomain
  before_action :get_event_from_params, :only => [:create, :index]
  before_action :find_wave, :only => [:edit, :update]

  def create
    @wave = @event.waves.build(wave_params)

    respond_to do |format|
      if @wave.save
        format.js { render :js => "window.location.href = '#{waves_path}'" }
      else
        format.js
        format.html { render 'new' }
      end
    end
  end

  def new
    @wave = Wave.new
  end

  def index
    @wave = Wave.new
    @waves = @event.waves
  end

  def edit
    @event = @wave.event
  end

  def update
    if @wave.update(wave_params)
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  private 

  def find_wave
    @wave = Wave.find_by id: params[:id]
  end

  def wave_params
    params.require(:wave).permit(
      :quantity,
      :title,
      :start_time
      )
  end

end