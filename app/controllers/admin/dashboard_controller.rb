class Admin::DashboardController < Admin::BaseController
  def index
    @users = User.all
    @category = Category.all
    @request = Request.all
    @books = Book.all
  end
end
