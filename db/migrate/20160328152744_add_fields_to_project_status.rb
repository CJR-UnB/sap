class AddFieldsToProjectStatus < ActiveRecord::Migration
  def change
    add_column :project_statuses, :change_column, :string
    add_column :project_statuses, :, :project_statuses,
    add_column :project_statuses, :, :description,
    add_column :project_statuses, :, :name
  end
end
