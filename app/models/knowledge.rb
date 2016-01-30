class Knowledge < ActiveRecord::Base

  belongs_to :technology
  belongs_to :knowledge_level
  
  has_many :knowledge_requests
  
  has_and_belongs_to_many :members

end
