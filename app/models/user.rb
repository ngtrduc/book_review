class User < ApplicationRecord
  has_one :profile
  has_many :comments
  has_many :suggestions
  has_many :feedbacks
  has_many :notifications
  has_many :travel_teams
  has_many :teams, class_name: "UserTeam"
end
