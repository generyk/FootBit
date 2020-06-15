class TryoutsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:team_id] && @team = Team.find_by_id(params[:team_id])
      @tryouts = @team.tryouts
    else
    @tryouts = Tryout.all
    end
  end

  def new
    @tryout = Tryout.new
  end

  def create
    @tryout = current_user.tryouts.build(tryout_params)
    if @tryout.save
      redirect_to tryout_path
    else
      render :new
    end
  end

  def show
    @tryout = Tryout.find_by(id: params[:id])
  end

  def edit
    @tryout = Tryout.find_by(id: params[:id])
  end

  private

  def tryout_params
    params.require(:tryout).permit(:title,:content)
  end
end
