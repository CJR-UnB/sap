class MembersProject < ActiveRecord::Base

  belongs_to :member
  belongs_to :project
  belongs_to :project_role

  def alocacao_completa
    "[#{self.project.try(:description)}] #{self.member.try(:member_name)}"
  end

end