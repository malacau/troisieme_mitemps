class LiguesController < ApplicationController
  def show
    @ligue = Ligue.find(params[:id])
    @participation = Participation.new
  end
end
