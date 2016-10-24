class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  scope :list_favorite, -> (user){
    where(user_id: user.id)
  }
end
