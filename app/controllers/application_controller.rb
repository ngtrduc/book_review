class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_param_for_header
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  include PublicActivity::StoreController
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up do |u|
      u.permit :name, :email, :password, :password_confirmation, :remember_me
    end
    devise_parameter_sanitizer.permit :account_update do |u|
      u.permit :name, :email, :password, :password_confirmation, :current_password
    end
  end

  def load_param_for_header
    @q = Book.ransack params[:q]
    @notifications = current_user.notifications.includes(:target, :owner)
      .order(created_at: :desc).limit(10) if current_user
  end
end
