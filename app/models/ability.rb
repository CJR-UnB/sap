class Ability

  include CanCan::Ability

  def initialize(member)

    if member.admin?

      can :manage, :all

    elsif member.mod?

      can :read, :all

    else

      can :read, :all

    end

  end

end