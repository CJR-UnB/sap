class ChangeDescriptionProjectStatusToName < ActiveRecord::Migration
  def change
  	rename_column :project_statuses, :description, :status
  end
end
