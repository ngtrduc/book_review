class Book < ActiveRecord::Base
  ratyrate_rateable "title"

  belongs_to :category
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_many :marks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: {maximum: 150}
  validates :publish_date, presence: true
  validates :author, presence: true
  validates :number_page, presence: true
  validate :picture_size

  scope :mark_book, -> (book,current_user) do
    joins(:marks).where(:marks, {user_id: current_user.id, book_id: book.id})
  end

  scope :mark_favorite, -> (book, current_user) do
    joins(:favorites).where(:favorites, {user_id: current_user.id, book_id: book.id})
  end

  def marked_reading? current_user
    marks.find_by user: current_user, status: Settings.books.marked_book.reading
  end

  def marked_read? current_user
    marks.find_by user: current_user, status: Settings.books.marked_book.read
  end

  def marked_favorite? current_user
    favorites.find_by user: current_user
  end

  def destroy_marked_book current_user
    marks.find_by(user: current_user).destroy
  end

  def load_marked_book current_user
    marks.find_by user: current_user
  end

  def load_marked_favorite current_user
    favorites.find_by user: current_user
  end

  def update_rate_avg
    if self.reviews.size > 0
      @value =  self.reviews.average(:rating)
      update_attributes(rate_avg: @value.to_f.round(1))
    end
  end

  private
  def picture_size
    if picture.size > Settings.admin.books.pic_size.megabytes
      errors.add(:picture, I18n.t("models.book.validate_picture"))
    end
  end
end
