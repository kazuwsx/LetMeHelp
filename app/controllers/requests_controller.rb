class RequestsController < ApplicationController
  before_action :redirect_to_root, except: :index,unless: :user_signed_in?
  
  def index 
    @requests = Request.all
  end

  def create
    r = Request.new(request_params)
    r.user_id = current_user.id
    r.accepted = false
    r.completed = false
    r.save!
    redirect_to action: :index
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
  end
  
  private
  def request_params
    params.require(:request).permit(:title, :detail_information)
  end

  def redirect_to_root
    redirect_to :root, notice: :'ログインを行ってください'
  end
end
