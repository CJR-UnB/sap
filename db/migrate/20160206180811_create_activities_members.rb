class CreateActivitiesMembers < ActiveRecord::Migration
  def change
    create_table :activities_members do |t|
      t.references :member, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
