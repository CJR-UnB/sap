class RemoveStatusFromMemberStatus < ActiveRecord::Migration
  def change
    remove_column :member_statuses, :status, :string
  end
end
