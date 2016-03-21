class Ability

  include CanCan::Ability

  def initialize(member)

    if member.admin? # Líder da NDP

      can :manage, :all

    elsif member.mod? # Talvez gerentes de projeto e líderes

      can :read, :all
      can [:associar], Activity
      can :manage, [ActivitiesMember, ProjectHistory, ProjectMemberHistory, MembersProject]
      cannot :crud, Project
      can [:requisitar], Knowledge
      can :create, KnowledgeRequest
      can [:create, :edit, :update], Member

    else # Outros membros

      can :read, :all
      can [:new, :create], SuggestedActivity
      can [:associar], Activity
      can [:create, :edit, :update, :destroy], ActivitiesMember
      can [:requisitar], Knowledge
      cannot :read, [Project, ProjectHistory]
      can [:edit, :update], Member
      
    end

  end

end