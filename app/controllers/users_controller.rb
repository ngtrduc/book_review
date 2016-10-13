class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.page(params[:page]).per Settings.per_page
  end

  def edit
  end

  def show
    @user = current_user if @user.nil?
    @favorite_books = Book.where(id: Mark.favorite(@user).pluck(:book_id))
      .page(params[:page]).per Settings.favorites.page
    @reading_books = Book.where(id: Mark.reading(@user).pluck(:book_id))
      .page(params[:page]).per Settings.favorites.page
    @activities = PublicActivity::Activity.order("created_at desc")
      .where owner: @user
  end

  def update
    if @user.update user_params
      flash[:update_success] = t "application.flash.users.updated_success"
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar
  end
end
