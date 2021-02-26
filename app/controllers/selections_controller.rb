class SelectionsController < ApplicationController
  def update
    @selection = Selection.find(params[:id])
    @player = Player.find(params[:format])
    @selection.player = @player
    # @line_up.selections.find {|selection| selection.player == @selection.player}
    if @selection.save
      redirect_to line_up_path(@selection.line_up)
    else
      render line_up_path(@selection.line_up)
    end
  end
end

