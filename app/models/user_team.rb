class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :travel_team
end
