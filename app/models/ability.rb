class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:create, :show, :update], Profile, { user_id: user.id }
    can [:create, :show, :update], Motivation, { user_id: user.id }
    can [:create, :show, :update], Presentation, { user_id: user.id }
    can [:create, :show, :update], Language, { user_id: user.id }

    can :manage, Education, { user_id: user.id }
    can :manage, Work, { user_id: user.id }
  end
end
