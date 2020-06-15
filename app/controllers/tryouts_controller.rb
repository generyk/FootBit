class TryoutsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @tryout = Tryout.new
  end

  def create
    @tryout = Tryout.new(tryout_params)
    @tryout.user_id = session[:user_id]
    if @tryout.save
      redirect_to tryout_path(@tryout)
    else
      render :new
    end
  end

  private

  def tryout_params
    params.require(:tryout).permit(:title,:content)
  end
end
