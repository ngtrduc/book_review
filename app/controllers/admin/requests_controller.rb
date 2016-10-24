class Admin::RequestsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @requests = Request.page(params[:page]).per Settings.admin.books.page
  end

  def update
    if @request.update_attributes status: Settings.accept_request
      flash[:info] = t "admin.request_mailer.success"
      Admin::RequestMailer.accept_request(@request).deliver_now
    else
      flash[:warning] = t "admin.request_mailer.fail"
    end
      redirect_to admin_requests_path
  end

end
