class ProfilesController < ApplicationController
  def update
    p = Profile.find_by(user_id: current_user.id).blank? ? Profile.new : Profile.find_by(user_id: current_user.id)
    p.image = profile_params[:image]
    p.user_id = current_user.id
    if p.save
      flash[:success] = "画像の設定に成功しました。"
    end
  end
  private
  def profile_params
    params.permit(:image)
  end
end
