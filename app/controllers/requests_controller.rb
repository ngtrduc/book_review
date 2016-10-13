class RequestsController < ApplicationController
  load_and_authorize_resource
  before_action :load_requests, only: [:index]

  def index
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new request_params
    if @request.save
      flash[:success] = t "application.flash.user_requests.create_success"
      redirect_to requests_path
    else
      render :new
    end
  end

  def destroy
    if @request.destroy
      flash[:success] = t "application.flash.user_requests.destroy_success"
    else
      flash[:error] = t "application.flash.user_requests.destroy_fail"
    end
    redirect_to requests_path
  end

  private
  def load_requests
    @requests = (current_user.requests.order created_at: :desc)
      .page(params[:page]).per Settings.admin.books.page
  end

  def request_params
    params.require(:request).permit :user_id, :content
  end
end
