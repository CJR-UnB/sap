class CreateProjectStatuses < ActiveRecord::Migration
  def change
    create_table :project_statuses do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
