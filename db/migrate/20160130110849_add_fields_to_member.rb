class AddFieldsToMember < ActiveRecord::Migration
  def change
    add_column :members, :name, :string
    add_column :members, :last_name, :string
    add_reference :members, :job, index: true, foreign_key: true
    add_reference :members, :role, index: true, foreign_key: true
    add_reference :members, :sector, index: true, foreign_key: true
    add_reference :members, :area, index: true, foreign_key: true
    add_reference :members, :member_status, index: true, foreign_key: true
  end
end
