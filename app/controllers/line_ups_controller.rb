class LineUpsController < ApplicationController
    def index
        @line_ups = LineUp.all
    end
    def show
        @line_up = LineUp.find(params[:id])
    end
end
