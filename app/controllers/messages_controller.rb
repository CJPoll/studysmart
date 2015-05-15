class MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_message, only: [:show]

  def new
    @message = Message.new
    @recipient = User.find params[:user_id]
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @recipient = User.find(params[:user_id])
    @message.recipients << @recipient

    respond_to do |format|
      if @message.save
        format.html {
          redirect_to :universities
        }
      else
        format.html {
          @recipient = @message.recipients.first
          render :new
        }
      end
    end
  end

  def show
  end

  def index
    @messages = current_user.messages.order(:created_at).reverse_order
  end

  private
  def get_message
    @message = Message.find params[:message_id]
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
