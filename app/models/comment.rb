class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place_review
end
