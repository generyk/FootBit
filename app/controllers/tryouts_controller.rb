class TryoutsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    if params[:team_id] && @team = Team.find_by_id(params[:team_id])
      @tryouts = @team.tryouts
    else
    @error = "This team doesn't exist" if params[:team_id]
    @tryouts = Tryout.all
    end
  end

  def new
    if params[:team_id] && @team = Team.find_by_id(params[:team_id])
      @tryout = @team.tryouts.build
    else
    @error = "This team doesn't exist" if params[:team_id]
    @tryout = Tryout.new
    end
  end

  def create
    @tryout = current_user.tryouts.build(tryout_params)
    if @tryout.save
      redirect_to tryout_path(@tryout)
    else
      render :new
    end
  end

  def show
    @tryout = Tryout.find_by(id: params[:id])
  end

  def edit
    @tryout = Tryout.find_by(id: params[:id])
    redirect_to tryout_path(@tryout) if !@tryout || @tryout.user != current_user
  end

  def update
    @tryout = Tryout.find_by(id: params[:id])
    redirect_to tryout_path if !@tryout || @tryout.user != current_user
    if @tryout.update(tryout_params)
      redirect_to tryout_path(@tryout)
    else
      render :edit
    end
  end

  private

  def tryout_params
    params.require(:tryout).permit(:title,:content,:team_id)
  end
end
