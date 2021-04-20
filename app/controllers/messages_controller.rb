class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def inbox
    user_sent = Message.where(user_id: current_user, group_id: nil, show_user: true)
    user_received = Message.where(recipient_id: current_user, show_recipient: true)
    @messages = (user_sent + user_received).sort{|a,b| a.created_at <=> b.created_at }
  end

  # GET /messages/1 or /messages/1.json
  def show
    @message = Message.find(params[:id])
    if current_user.id == @message.user_id
      @message.update_attribute(:user_read, true)
    elsif current_user.id == @message.recipient_id
      @message.update_attribute(:recipient_read, true)
    end
  end

  # GET /messages/new
  def new
    @message = Message.new(:parent_id => params[:parent_id])
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json

  def create
    @message = Message.new(message_params)
    if @message.save
      if @message.group_id
        redirect_to group_path(session[:group_id])
      else
        redirect_to inbox_path
      end
    else
      render :new
   end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    if @message.user_id = current_user.id
      @message.update_attribute(:show_user, false)
      respond_to do |format|
        format.html { redirect_to inbox_path, notice: "Message deleted." }
        format.json { head :no_content }
      end 
    elsif @message.recipient_id == current_user.id
      @message.update_attribute(:show_recipient, false)
      respond_to do |format|
        format.html { redirect_to inbox_path, notice: "Message deleted." }
        format.json { head :no_content }
      end 
    end
    if @message.show_user == false && @message.show_recipient == false
      @message.destroy
      respond_to do |format|
        format.html { redirect_to inbox_path, notice: "Message deleted" }
        format.json { head :no_content }
      end 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:parent_id, :user_id, :recipient_id, :group_id, :subject, :body, :read, :show_user, :show_recipient)
    end
end
