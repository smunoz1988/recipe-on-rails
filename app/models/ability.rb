class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Food, public: true

    return unless user.present?  # additional permissions for logged in users (they can read their own posts)
    can :read, Food, user: user

    return unless user.admin?  # additional permissions for administrators
    can :manage, Food
  end
end