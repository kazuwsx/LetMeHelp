class ChatsController < ApplicationController
  before_action :redirect_to_root, unless: :user_signed_in?
  def index
    @request = Request.find(params[:id])
    @chats = Chat.where(request_id: @request.id).order(created_at: 'desc').limit(6)
  end
  
  def create
    @chat = Chat.new
    @chat.comment =  chat_params[:comment]
    @chat.user_id = current_user.id
    @chat.request_id = chat_params[:request_id]
    @chat.save
    chat = {comment: @chat.comment, image: @chat.user.profile.image.url}
    render :json => chat
  end

  private
  def chat_params
    params.permit(:comment, :request_id)
  end

  def redirect_to_root
    redirect_to :root, notice: :'ログインを行ってください'
  end
end
