class ReviewVote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user
  after_create :update_review_votes

  private
  def update_review_votes
    review.update_votes
  end
end
