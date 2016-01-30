class CreateMemberHasKnowledges < ActiveRecord::Migration
  def change
    create_table :member_has_knowledges do |t|
      t.references :member, index: true, foreign_key: true
      t.references :knowledge, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
