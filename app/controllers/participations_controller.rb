class ParticipationsController < ApplicationController

  def create
    @participation = Participation.new
    @user = User.find(params[:participation][:user_id])
    @participation.user = @user
    @ligue = Ligue.find(params[:ligue_id])
    @participation.ligue = @ligue
    if @participation.save
      redirect_to ligue_path(@participation.ligue)
    else
      render :show
    end
  end
end
