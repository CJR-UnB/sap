class MemberHasActivity < ActiveRecord::Base

  belongs_to :member
  belongs_to :activity
  
end
