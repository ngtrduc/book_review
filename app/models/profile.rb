class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :address
end
