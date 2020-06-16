class TeamsController < ApplicationController
before_action :redirect_if_not_logged_in

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)

    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def index
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @teams = @user.teams
    else
      @error = "This user doesn't exist" if params[:user_id]
      @teams = Team.alpha  
      end
    end

  def show
    @team = Team.find_by_id(params[:id])
    redirect_to teams_path if !@team
  end

  private

  def team_params
    params.require(:team).permit(:name,:location)
  end
end
