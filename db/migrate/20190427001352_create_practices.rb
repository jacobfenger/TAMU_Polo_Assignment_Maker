class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.references :user, foreign_key: true
      t.references :assignment, foregin_key:true, index: true
      t.time :time
      t.datetime :date
      t.string :summary
    end
  end
end
