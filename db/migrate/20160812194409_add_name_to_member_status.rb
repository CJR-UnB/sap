class AddNameToMemberStatus < ActiveRecord::Migration
  def change
    add_column :member_statuses, :name, :string
  end
end
