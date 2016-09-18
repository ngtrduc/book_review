class Feedback < ApplicationRecord
  belongs_to :place_review
  belongs_to :user
end
