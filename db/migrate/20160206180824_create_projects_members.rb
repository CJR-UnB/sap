class CreateProjectsMembers < ActiveRecord::Migration
  def change
    create_table :projects_members do |t|
      t.references :member, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
