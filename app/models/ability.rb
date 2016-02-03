class Ability

  include CanCan::Ability

  def initialize(member)

    member ||= Member.new

    if member.admin?
      can :manage, :all
    elsif member.mod?
      can :manage, :all
    else
      can :read, :all
      can [:update], Member
    end
    
  end

end