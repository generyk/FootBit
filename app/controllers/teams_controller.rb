class TeamsController < ApplicationController
before_action :redirect_if_not_logged_in

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = session[:user_id]
    if @team.save
      redirect_to team_path
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name,:location)
  end
end
