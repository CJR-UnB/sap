class AddProjectRoleToMembersProject < ActiveRecord::Migration
  def change
    add_reference :members_projects, :project_role, index: true, foreign_key: true
  end
end
