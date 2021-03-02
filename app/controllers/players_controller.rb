class PlayersController < ApplicationController

  def index

  end

  def search
    @selection = Selection.find(params[:request][:selection_id])
    @players = Player.selectable_for(@selection)
    @line_up = @selection.line_up
    @line_up_teams = []
        @line_up.selections.each do |selection|
          @line_up_teams << selection.player.team.name
        end
    # @players = Player.all
    if !(params[:request][:name].blank?)
      sql_query = "players.last_name @@ :name"
      @players = @players.where(sql_query, name: "%#{params[:request][:name]}%")
    end
    if !(params[:request][:team].blank?)
      @players = @players.joins(:team).where(teams: {name: params[:request][:team]})
    end
    players_html = render_to_string(partial: "line_ups/selection_players_modale.html.erb", locals: { players: @players, selection: @selection, line_up_teams: @line_up_teams })
    respond_to do |format|
      format.html
      format.json { render json: { players: players_html }}
    end
  end
end
