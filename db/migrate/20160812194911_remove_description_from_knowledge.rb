class RemoveDescriptionFromKnowledge < ActiveRecord::Migration
  def change
    remove_column :knowledges, :description, :string
  end
end
