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

end



#itérer sur chaque user
# si le round du lineup du user a une date inférieure à la date d'aujorudmhui
#alors calculer le score de chaque joueur et le stocker dans selection et créer un nouveau lineup pour ce user
#ce qui créera un nouveau lineup


