class Review < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}

  belongs_to :user
  belongs_to :book

  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validate :check_rating

  scope :order_reviews, ->{order created_at: :DESC}
  after_create :update_book_rate_avg

  private
  def check_rating
    if rating < 1 || rating > 10
      errors.add :rating, I18n.t("reviews.validate_rating")
    end
  end

  def update_book_rate_avg
    book.update_rate_avg
  end
end
