class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can [:edit, :update], User
      can [:create, :destroy], Request
      can [:create, :edit, :update, :destroy], Review, user_id: user.id
      can [:create], Comment
      can [:create, :destroy], Mark
      can [:create, :destroy], Favorite
      can [:create, :destroy], Like
    end
  end
end
