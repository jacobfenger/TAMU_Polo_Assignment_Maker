class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user, foreign_key: true
      t.references :horse1
      t.references :horse2
      t.references :horse3
      t.references :practice, index: true
      t.string :note
      t.timestamps null: false
    end
  end
end
