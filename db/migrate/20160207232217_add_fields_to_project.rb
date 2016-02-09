class AddFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :start_date, :string
    add_column :projects, :end_date, :string
    add_column :projects, :git, :string
    add_column :projects, :heroku, :string
  end
end
