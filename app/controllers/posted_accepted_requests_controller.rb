class PostedAcceptedRequestsController < ApplicationController
  def index
    @requests = Request.where(accepted: true, user_id: current_user.id)
  end
end
