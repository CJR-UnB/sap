class RemoveDescriptionFromActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :description, :string
  end
end
