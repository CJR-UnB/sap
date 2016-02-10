class Knowledge < ActiveRecord::Base
  
  belongs_to :knowledge_level
  belongs_to :technology

  has_and_belongs_to_many :members

  def conhecimento_completo
    "#{self.description}: #{self.knowledge_level.try(:description)} (#{self.technology.try(:name)})"
  end

end