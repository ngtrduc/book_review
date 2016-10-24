class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.page(params[:page]).per Settings.per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "application.flash.users.success"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = t "application.flash.users.update_success"
      redirect_to admin_users_path @user
    else
      flash[:error] = t "application.flash.users.update_error"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "application.flash.users.destroy_success"
    else
      flash[:error] = t "application.flash.users.destroy_error"
    end
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :role, :avatar
  end
end
