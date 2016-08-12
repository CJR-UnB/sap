class RemoveDescriptionFromRequestStatus < ActiveRecord::Migration
  def change
    remove_column :request_statuses, :description, :string
  end
end
