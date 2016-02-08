class CreateProjectMemberHistories < ActiveRecord::Migration
  def change
    create_table :project_member_histories do |t|
      t.text :observation
      t.references :members_project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
