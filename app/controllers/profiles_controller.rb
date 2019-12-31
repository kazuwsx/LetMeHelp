class ProfilesController < ApplicationController
  def update
    u = User.find_by(id: current_user.id)
    u.image = profile_params[:image]
    if u.save
      flash[:notice] = "画像の設定に成功しました。"
    end
  end
  private
  def profile_params
    params.permit(:image)
  end
end
