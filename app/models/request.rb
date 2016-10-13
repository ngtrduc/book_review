class Request < ActiveRecord::Base
  belongs_to :user

  enum status: [:waitting, :denied, :accepted]
end
