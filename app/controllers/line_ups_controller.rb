class LineUpsController < ApplicationController
    def index
        @line_ups = LineUp.all
    end
    def show
        @line_up = LineUp.find(params[:id])
        @line_up_teams = []
        @line_up.selections.each do |selection|
          @line_up_teams << selection.player.team.name
        end
    end
end
