require 'rest-client'

class SelectionsController < ApplicationController
  def update
    @selection = Selection.find(params[:id])
    @player = Player.find(params[:format])
    @selection.line_up.budget = @selection.line_up.budget + @selection.player.cote - @player.cote
    @selection.player = @player
    @selection.line_up.save

    # @line_up.selections.find {|selection| selection.player == @selection.player}
    if @selection.save
      redirect_to line_up_path(@selection.line_up)
    else
      render line_up_path(@selection.line_up)
    end
  end


  result = RestClient::Request.execute(method: :get, url: 'https://rugby-live-data.p.rapidapi.com/fixtures/1230/2021', headers: {'x-rapidapi-key' => 'b68feda314mshc3fa35e38ccd559p1729eajsn8ecb020639db', 'x-rapidapi-host' => 'rugby-live-data.p.rapidapi.com'})
  line_up.score = 0
  line_up.score += selection.rating
  def score
    line_up.selections.each do |selection|
      if selection.player.team.results.won?
        selection.rating = 50
        selection.save
      elsif selection.player.team.results.drawn?
        selection.rating = 20
        selection.save
      else selection.player.team.results.lost?
        selection.rating = 0
        selection.save
      end
    end
  end
end

line_up.score = 0
line_up.score += selection.rating

Team.all.each do |team|
  rencontres.each_with_index do |rencontre, index|
    if rencontre.values.include?(team.city)
      if rencontre.key(team.city) == "home"
        if rencontre["home_score"] > rencontre["away_score"]
          team.results = "won"
        elsif rencontres["home_score"] < rencontre["away_score"]
          team.results = "lost"
        else
          team.results = "drawn"
        end
      else
        if rencontre["away_score"] > rencontre["home_score"]
          team.results = "won"
        elsif rencontres["away_score"] < rencontre["home_score"]
          team.results = "lost"
        else
          team.results = "draw"
        end
      end
    end
  end
end

#itérer sur chaque user
# si le round du lineup du user a une date inférieure à la date d'aujorudmhui
#alors calculer le score de chaque joueur et le stocker dans selection et créer un nouveau lineup pour ce user
#ce qui créera un nouveau lineup


