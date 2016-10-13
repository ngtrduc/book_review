class Admin::RequestsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    @requests = Request.page(params[:page]).per Settings.admin.books.page
  end
end
