class LiguesController < ApplicationController
  def new
    @ligue = Ligue.new
  end

  def create
    @ligue = Ligue.new(ligue_params)
    @ligue.user = current_user
    if @ligue.save
      redirect_to ligue_path(@ligue)
    else
      render :new
    end
  end

  def show
    @ligue = Ligue.find(params[:id])
    @participation = Participation.new
    allusers = User.all
    @users = allusers.reject do |user|
      user.participations.any? do |participation|
        participation.ligue == @ligue
      end
    end
  end

  def index
    @ligues = Ligue.all
  end

  private

  def ligue_params
    params.require(:ligue).permit(:name,:description,:password,:photo)
  end
end
