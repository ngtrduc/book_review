class Admin::RequestsController < Admin::BaseController
  before_action :authenticate_user!

  def index
    @requests = Request.includes(:user).order(:status).page(params[:page]).per Settings.admin.books.page
  end

  def show
    @request = Request.find params[:id]
  end

  def update
    @request = Request.find params[:id]
    if @request.update_attributes status: params[:status]
      if @request.accepted?
        flash[:info] = t "admin.request_mailer.success"
      else
        flash[:info] = "User's request is denied."
      end
    else
      flash[:warning] = t "admin.request_mailer.fail"
    end
    redirect_to admin_requests_path
  end

  def destroy
    @request = Request.find(params["id"])
    if @request.destroy
      flash[:success] = t "application.flash.user_requests.destroy_success"
    else
      flash[:error] = t "application.flash.user_requests.destroy_fail"
    end
    redirect_to admin_requests_path
  end

end
