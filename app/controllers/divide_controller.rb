class DivideController < ApplicationController
  def index
    if user_signed_in?
      if current_user.helper == true
        redirect_to requesters_path
      elsif current_user.helper == false 
        redirect_to helpers_path
      end
    else
      redirect_to home_index_path
    end
  end
end
