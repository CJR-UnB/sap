class AddLevelToKnowledge < ActiveRecord::Migration
  def change
    add_column :knowledges, :level, :text
  end
end
