class AddCreditsToSuggestedActivity < ActiveRecord::Migration
  def change
    add_column :suggested_activities, :credit_numbers, :integer
  end
end
