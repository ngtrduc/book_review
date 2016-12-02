class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.page(params[:page]).per Settings.per_page
  end

  def edit
  end

  def show
    @favorite_books = Book.where(id: Favorite.list_favorite(@user).pluck(:book_id))
      .page(params[:page]).per Settings.favorites.page
    @reading_books = Book.where(id: Mark.reading(@user).pluck(:book_id))
      .page(params[:page]).per Settings.favorites.page
    load_activities
    @top_reviews = @user.reviews.order("vote_count DESC").includes(:book)
      .page(params[:page]).per Settings.review.page
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

  def load_activities
    following_ids = @user.following_ids.join(', ')
    @activities = PublicActivity::Activity.order("created_at desc")
      .where("owner_id IN (?) OR owner_id = ?", following_ids, @user.id).page(params[:page]).per Settings.activity.page
  end

end
