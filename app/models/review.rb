class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validate :check_rating

  scope :order_reviews, ->{order created_at: :DESC}

  private
  def check_rating
    if rating < 1 || rating > 10
      errors.add :rating, I18n.t("reviews.validate_rating")
    end
  end
end
