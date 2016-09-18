class PlaceReview < ApplicationRecord
  belongs_to :address

  has_many :comments
  has_many :travel_teams
  has_many :feedbacks
end
