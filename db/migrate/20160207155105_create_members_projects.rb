class CreateMembersProjects < ActiveRecord::Migration
  def change
    create_table :members_projects do |t|
      t.references :member, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
