class ApproveController < ApplicationController
  def index
    r = Request.find(params[:id])
    r.accept_user_id = current_user.id
    r.accepted = true
    r.save
    redirect_to request_path(params[:id]), notice: '承認に成功しました'
  end
end
