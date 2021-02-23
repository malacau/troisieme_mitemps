class MessagesController < ApplicationController
  def index
    @ligue = ligue(params[:id])
    @messages = @ligue.messages.all
    @message = Message.new
  end

  def create
      @message = Message.new(message_params)
      @message.user = current_user
  end

  private

  def message_params
    params.require(:message).permit(:content,:ligue_id,:user_id)
  end

end
