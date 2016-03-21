class SuggestedActivity < ActiveRecord::Base
  belongs_to :activity_type
  belongs_to :member
  belongs_to :request_status
end
