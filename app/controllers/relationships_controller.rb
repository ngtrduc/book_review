class RelationshipsController < ApplicationController

  def index
    @user  = User.find_by id: params[:id]
    relationship = params[:relationship]
    @title = t "views.shared.stats.title.#{relationship}"
    @users = @user.send(relationship).page(params[:page]).per Settings.per_page
    render "users/show_follow"
  end

  def create
    @user = User.find params[:followed_id]
    current_user.follow @user
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow @user
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
