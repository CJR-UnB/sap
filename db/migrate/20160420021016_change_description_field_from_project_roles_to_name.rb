class ChangeDescriptionFieldFromProjectRolesToName < ActiveRecord::Migration
  def change
  	rename_column :project_roles, :description, :name
  end
end
