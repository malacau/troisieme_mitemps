class PlayersController < ApplicationController

  def index
    @players = Player.all
    if !(params[:request][:name].blank?)
      sql_query = "players.name @@ :name"
      @players = @players.where(sql_query, name: "%#{params[:request][:name]}%")
    end
    if !(params[:request][:team].blank?)
      @players = @players.joins(:team).where(teams: {name: params[:request][:team]})
    end
  
  end
end