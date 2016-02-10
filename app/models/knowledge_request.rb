class KnowledgeRequest < ActiveRecord::Base

  belongs_to :member
  belongs_to :knowledge
  belongs_to :request_status
  
  def requisicao_completa
    "#{self.created_at.strftime("%d de %B de %Y, %H:%Mh")}: #{self.knowledge.try(:description)} - #{self.knowledge.try(:knowledge_level).try(:description)} (#{self.member.try(:member_name)})"
  end

  def analisado?
    not(self.try(:request_status).try(:description) == "Em análise")
  end

end