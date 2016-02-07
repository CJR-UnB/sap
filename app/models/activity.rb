class Activity < ActiveRecord::Base

  belongs_to :activity_type
  
  has_and_belongs_to_many :members

end