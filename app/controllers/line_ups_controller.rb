class LineUpsController < ApplicationController
    def index
        @line_ups = LineUp.includes(:player, :team)
    end
    def show
        @line_up = LineUp.find(params[:id])
        @line_up_teams_id = @line_up.teams.map(&:id)
        @teams = Team.all.map(&:name)
    end
end
