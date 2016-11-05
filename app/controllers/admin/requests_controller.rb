class Admin::RequestsController < Admin::BaseController
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
