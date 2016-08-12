class RemoveStatusFromProjectStatus < ActiveRecord::Migration
  def change
    remove_column :project_statuses, :status, :string
  end
end
