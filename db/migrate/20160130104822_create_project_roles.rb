class CreateProjectRoles < ActiveRecord::Migration
  def change
    create_table :project_roles do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
