class SubmitLocationController < ApplicationController
  #チャットにログインしているユーザーの位置情報を追加する
  def index
    @chat = Chat.new(request_id: params[:id])
    @chat.comment = current_user.location_information
    @chat.user_id = current_user.id
    @chat.save
    redirect_to :back
  end
end
