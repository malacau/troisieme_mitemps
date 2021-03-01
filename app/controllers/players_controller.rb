class PlayersController < ApplicationController

  def index
    
  end

  def search
    @players = Player.all
    if !(params[:request][:name].blank?)
      sql_query = "players.last_name @@ :name"
      @players = @players.where(sql_query, name: "%#{params[:request][:name]}%")
    end
    if !(params[:request][:team].blank?)
      @players = @players.joins(:team).where(teams: {name: params[:request][:team]})
    end
    coco = render_to_string(partial: "line_ups/selection_players_modale.html.erb", locals: { players: @players }) 
    respond_to do |format|
      format.html
      format.json { render json: { players: coco }}
    end
  end
end