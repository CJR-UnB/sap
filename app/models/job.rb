class Job < ActiveRecord::Base

  # Relacionamentos:
  # Possui muitos membros
  has_many :members

end