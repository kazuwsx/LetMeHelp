class AcceptedRequestsController < ApplicationController
  def index
    @requests = Request.where(accept_user_id: current_user.id)
  end
end
