class RenameAllTheDescriptionFields < ActiveRecord::Migration
  def change
  	rename_column :projects, :description, :name 
  	rename_column :roles, :description, :role
  	rename_column :member_statuses, :description, :status
  	rename_column :activity_types, :description, :name
  end
end
