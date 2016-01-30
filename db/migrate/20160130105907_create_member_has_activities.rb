class CreateMemberHasActivities < ActiveRecord::Migration
  def change
    create_table :member_has_activities do |t|
      t.references :member, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
