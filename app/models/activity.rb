class Activity < ActiveRecord::Base

  belongs_to :activity_type
  
  has_and_belongs_to_many :members

  def atividade_completa
    "#{self.description}: #{self.activity_type.try(:description)} (#{self.credit_numbers} créditos)"
  end

end