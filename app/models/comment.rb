class Comment < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user},
    recipient: :review

  belongs_to :user
  belongs_to :review

  validates :content, presence: true
end
