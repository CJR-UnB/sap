class ProjectRole < ActiveRecord::Base
  has_many :project_member_histories
end
