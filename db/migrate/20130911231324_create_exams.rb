class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :matter_id
      t.datetime :dt_exam
      t.string :location
      t.decimal :grade

      t.timestamps
    end
  end
end
