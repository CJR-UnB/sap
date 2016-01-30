class RequestStatus < ActiveRecord::Base
  has_many :knowledge_requests
end
