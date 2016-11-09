class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @comment = current_user.comments.build comment_params
    @review = @comment.review
    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_url }
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
