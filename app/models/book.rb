class Book < ActiveRecord::Base

  belongs_to :category
  has_attached_file :picture, styles: {medium: "300x300>", thumb: "100x100>"},
    default_url: "book/dac-nhan-tam.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_many :marks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: {maximum: 1000}
  validates :publish_date, presence: true
  validates :author, presence: true
  validates :number_page, presence: true
  paginates_per 4

  scope :best_book, -> do
    order("rate_avg DESC").limit(3)
  end

  scope :random_book, -> do
    order("RANDOM()").limit(3)
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
      @value =  self.reviews.average :rating
      update_attributes rate_avg: @value.to_f.round(2)
    end
  end
end
