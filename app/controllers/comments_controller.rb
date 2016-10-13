class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = current_user.comments.build comment_params
    @user = User.find_by id: @comment.user_id
    respond_to do |format|
      if @comment.save
        flash[:success] = t "comments.success"
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

  private
  def comment_params
    params.require(:comment).permit :content, :review_id
  end
end
