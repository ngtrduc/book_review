class Book < ActiveRecord::Base
  belongs_to :category
  mount_uploader :picture, PictureUploader
  has_many :marks, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
