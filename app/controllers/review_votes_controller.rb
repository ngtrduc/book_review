class ReviewVotesController < ApplicationController
  def create
    @vote = current_user.review_votes.create vote_params
    @review = @vote.review
    respond_to do |format|
      format.js
    end
  end

  private
  def vote_params
    params.require(:review_vote).permit :review_id
  end
end
