class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.references :user, foreign_key: true
      t.timestamps :time
      t.date_field :date
      t.string :summary
      t.references :assignment, foreign_key: true
    end
  end
end
