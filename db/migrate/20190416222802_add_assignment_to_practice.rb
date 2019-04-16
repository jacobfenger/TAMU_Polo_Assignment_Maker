class AddAssignmentToPractice < ActiveRecord::Migration
  def change
  	add_reference :practices, :assignment, index: true 
  	add_foreign_key :practices, :assignments
  end
end
