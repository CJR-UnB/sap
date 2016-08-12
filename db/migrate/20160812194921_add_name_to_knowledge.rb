class AddNameToKnowledge < ActiveRecord::Migration
  def change
    add_column :knowledges, :name, :string
  end
end
