class Admin::BaseController < ApplicationController
  layout "admin/application"

  before_filter :verify_admin

  private
  def verify_admin
    redirect_to root_url unless current_user.role == 0
  end
end
