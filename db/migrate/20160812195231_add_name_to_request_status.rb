class AddNameToRequestStatus < ActiveRecord::Migration
  def change
    add_column :request_statuses, :name, :string
  end
end
