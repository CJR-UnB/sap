class Project < ActiveRecord::Base

  belongs_to :project_status

  has_many :project_histories
  has_many :project_member_histories

  has_and_belongs_to_many :members

end