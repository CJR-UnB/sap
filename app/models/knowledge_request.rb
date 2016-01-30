class KnowledgeRequest < ActiveRecord::Base

  belongs_to :member
  belongs_to :knowledge
  belongs_to :request_status
  
end