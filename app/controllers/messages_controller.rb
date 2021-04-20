class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
    @message = Message.find(params[:id])
    @message.update_attribute(:read, true)
  end

  # GET /messages/new
  def new
    @message = Message.new(:parent_id => params[:parent_id])
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create_thread
    @message = Message.new(params[:message])
    if @message.save
      redirect_to messages_url
    else
      render :new
    end
  end

  def create
    puts params[:message]
    @message = Message.new(params[:message])
    if @message.save
      redirect_to messages_url
    else
      render :new
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    if @message.user_id = current_user.id
      @message.show_user = false
    elsif @message.recipient_id = current_user.id
      @message.show_recipient = false
    end
    if @message.show_user == false && @message.show_recipient == false
      @message.destroy
    end
    return redirect_to messages_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:user_id, :recipient_id, :group_id, :subject, :body, :read, :show_user, :show_recipient)
    end
end
