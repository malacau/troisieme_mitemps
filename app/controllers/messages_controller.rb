class MessagesController < ApplicationController
  def index
    @ligue = Ligue.find(params[:ligue_id])
    @messages = @ligue.messages.all
    @message = Message.new
  end

  def create
      @ligue = Ligue.find(params[:ligue_id])
      @message = Message.new(message_params)
      @message.user = current_user
      @message.ligue = @ligue
      if @message.save
        redirect_to ligue_messages_path(@ligue)
      else 
        render :index
      end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end


