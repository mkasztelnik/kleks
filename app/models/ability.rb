class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, elements, { user_id: user.id}

    unless user.submitted
      can [:create, :update], one_to_one_elements, { user_id: user.id }
      can :manage, one_to_many_elements, { user_id: user.id }
    end
  end

  private

  def elements
    one_to_one_elements + one_to_many_elements
  end

  def one_to_one_elements
    [Profile, Motivation, Presentation, Language]
  end

  def one_to_many_elements
    [Education, Conference, Other, Work, Publication, Training]
  end
end
