class Like < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}

  belongs_to :activity
  belongs_to :user

  validates :activity_id, presence: true
  validates :user_id, presence: true
end
