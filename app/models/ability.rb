class Ability
  include CanCan::Ability

  def initialize(user)
    if user && user.admin?
      can :manage, Animal
      can :manage, AnimalSighting
      can :manage, Biopsy
      can :manage, Blow
      can :manage, CloudCover
      can :manage, Fece
      can :manage, Mode
      can :manage, Region
      can :manage, SeaState
      can :manage, Sighting
      can :manage, Species
      can :manage, User
      can :manage, Vessel
    end
  end
end
