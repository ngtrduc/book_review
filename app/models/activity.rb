class Activity < ApplicationRecord
  belongs_to :user
  has_many :like_activities, dependent: :destroy
end
