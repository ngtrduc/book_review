class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = current_user.comments.build comment_params
    @review = @comment.review
    if @comment.save
      key = Notification.keys[:comment]
      NotificationBroadCastJob.perform_now @review, key, current_user.id
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    if @comment.update_attributes comment_params
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    #review = Review.find(@comment.review_id)
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
