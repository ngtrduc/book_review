class Book < ActiveRecord::Base
  belongs_to :category
  mount_uploader :picture, PictureUploader
  has_many :marks, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: {maximum: 150}
  validates :publish_date, presence: true
  validates :author, presence: true
  validates :number_page, presence: true
  validate :picture_size

  private
  def picture_size
    if picture.size > Settings.admin.books.pic_size.megabytes
      errors.add(:picture, I18n.t("models.book.validate_picture"))
    end
  end
end
