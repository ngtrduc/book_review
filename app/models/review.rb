class Review < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}

  belongs_to :user
  belongs_to :book
  validates :book_id, uniqueness: {scope: :user_id}
  has_many :comments, dependent: :destroy
  validates_inclusion_of :rating, in: 0..5

  validates :content, presence: true

  scope :order_reviews, ->{order created_at: :DESC}
  scope :random_reviews, ->{order("RANDOM()").limit 5}
  after_create :update_book_rate_avg

  private

  def update_book_rate_avg
    book.update_rate_avg
  end
end
