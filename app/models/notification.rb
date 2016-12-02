class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :target, polymorphic: true
  belongs_to :owner, polymorphic: true

  scope :not_seen, ->{where seen: false}
  enum key: [:accept, :reject, :comment, :vote, :follow]
end
