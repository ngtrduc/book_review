class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :avatar
  end

  def correct_user
    @user = User.find_by_id params[:id]
    redirect_to root_path unless @user == current_user
  end
end
