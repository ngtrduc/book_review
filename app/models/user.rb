class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  enum role: [:admin, :user]

  has_many :marks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def self.find_for_google_oauth2 access_token, signed_in_resource = nil
    data = access_token.info
    user = User.where(provider: access_token.provider, uid: access_token.uid ).first
    unless user
      registered_user = User.where(email: access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          name: data["name"],
          provider: access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
    user
  end

  def is_user? user
    self == user
  end

  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following? other_user
    following.include? other_user
  end

  def liked? activity
    likes.find_by activity_id: activity.id
  end

  private
  def picture_size
    if picture.size > Settings.users.pic_size.megabytes
      errors.add(:avatar, I18n.t("models.book.validate_picture"))
    end
  end
end
