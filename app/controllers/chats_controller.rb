class ChatsController < ApplicationController
  before_action :redirect_to_root, unless: :user_signed_in?
  def index
    @request = Request.find(params[:id])
    @chats = Chat.where(request_id: @request.id).order(created_at: 'desc')
    respond_to do |f|
      f.html
      f.json { @new_messages = @chats.where('id > ?', params[:message][:id])}
    end
  end
  
  def create
    @chat = Chat.new(chat_params)
    @chat.user_id = current_user.id
    if @chat.save
      respond_to do |f|
        f.json
      end
    end
  end

  private
  def chat_params
    params.permit(:comment, :request_id)
  end

  def redirect_to_root
    redirect_to :root, notice: :'ログインを行ってください'
  end
end
