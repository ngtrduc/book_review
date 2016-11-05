class Request < ActiveRecord::Base
  belongs_to :user

  enum status: [:waitting, :denied, :accepted]

  validates :content, presence: true, length: {maximum: 400}

  scope :accepted, ->{where status: :accepted}
end
