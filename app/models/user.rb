class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :comments
  has_many :suggestions
  has_many :feedbacks
  has_many :notifications
  has_many :travel_teams
  has_many :teams, class_name: "UserTeam"
end
