class NotAcceptedRequestsController < ApplicationController
  def index
    @requests = Request.where(accepted: false).where.not(user_id: current_user.id)
  end
end
