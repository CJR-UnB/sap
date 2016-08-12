class AddNameToProjectStatus < ActiveRecord::Migration
  def change
    add_column :project_statuses, :name, :string
  end
end
