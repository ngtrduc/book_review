class ReviewVotesController < ApplicationController
  def create
    @vote = current_user.review_votes.create vote_params
    @review = @vote.review
    key = Notification.keys[:vote]
    NotificationBroadCastJob.perform_now @review, key, current_user.id
    respond_to do |format|
      format.js
    end
  end

  private
  def vote_params
    params.require(:review_vote).permit :review_id
  end
end
