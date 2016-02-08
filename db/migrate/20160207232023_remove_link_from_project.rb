class RemoveLinkFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :link, :string
  end
end
