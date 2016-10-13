class LikesController < ActionController::Base
  load_and_authorize_resource

  def create
    @like = current_user.likes.create activity_id: params[:activity_id]
    @activity = PublicActivity::Activity.find_by id: params[:activity_id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @activity = PublicActivity::Activity.find_by id: params[:activity_id]
    @like.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end
end
