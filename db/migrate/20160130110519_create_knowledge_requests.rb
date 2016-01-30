class CreateKnowledgeRequests < ActiveRecord::Migration
  def change
    create_table :knowledge_requests do |t|
      t.references :member, index: true, foreign_key: true
      t.references :knowledge, index: true, foreign_key: true
      t.references :request_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
