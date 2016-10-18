class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @comment = current_user.comments.build comment_params
    @user = User.find_by id: @comment.user_id
    respond_to do |format|
      if @comment.save
        SendEmailWorker.perform_async @comment.id
        format.html{redirect_to :back}
        format.json{
          render json: {comment: @comment, user: @user, status: :created}
        }
      else
        format.html{redirect_to :back}
        format.json{render json: {status: :fail}}
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
