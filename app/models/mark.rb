class Mark < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}

  enum status: [:reading, :read]

  belongs_to :user
  belongs_to :book

  scope :favorite, -> (user){
    where(user_id: user.id, favorite: true)
  }

  scope :reading, -> (user){
    where(user_id: user.id, status: 0)
  }
end
