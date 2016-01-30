class CreateMemberStatuses < ActiveRecord::Migration
  def change
    create_table :member_statuses do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
