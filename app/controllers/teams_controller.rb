class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_event_from_params, :only => [:create, :index]
  before_action :find_team, :only => [:edit, :update]

  def create
    @team = @event.teams.build(team_params)
    @team.save
    redirect_to teams_path
  end

  def new
    @team = Team.new
  end

  def index
    @team = Team.new
    @teams = @event.teams
  end

  def edit
    @event = @team.event
  end

  def update
    if @team.update(team_params)
      redirect_to :back
    else
      redirect_to root_url
    end
  end

  private

  def find_team
    @team = Team.find_by id: params[:id]
  end

  def team_params
    params.require(:team).permit(
      :name
      )
  end
  
end
