class TravelTeam < ApplicationRecord
  belongs_to :user
  belongs_to :place_review

  has_many :members, class_name: "UserTeam"
end
