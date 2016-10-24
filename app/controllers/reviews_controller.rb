class ReviewsController < ApplicationController
  load_and_authorize_resource except: :show

  def create
    @new_review = current_user.reviews.build review_params
    if @new_review.save
      flash[:success] = t "reviews.messages.create_success"
      SendEmailWorkerReview.perform_async @new_review.id
    else
      flash[:warning] = t "reviews.messages.create_fail"
    end
    redirect_to @new_review.book
  end

  def edit
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = t "reviews.messages.update_success"
      redirect_to @review.book
    else
      flash[:warning] = t "reviews.messages.update_fail"
      render :edit
    end
  end

  def destroy
    if @review.destroy
      flash[:success] = t "reviews.messages.delete_success"
    else
      flash[:error] = t "reviews.messages.delete_fail"
    end
    redirect_to @review.book
  end

  private
  def review_params
    params.require(:review).permit :user_id, :book_id, :content, :rating
  end
end
