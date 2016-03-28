class CreateSuggestedActivities < ActiveRecord::Migration
  def change
    create_table :suggested_activities do |t|
      t.string :activity
      t.references :activity_type, index: true, foreign_key: true
      t.references :member, index: true, foreign_key: true
      t.references :request_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
