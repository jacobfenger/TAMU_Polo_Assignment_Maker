class AddPracticeIdToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :practice_id, :integer
  end
end
