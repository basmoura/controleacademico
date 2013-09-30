class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.decimal :value
      t.integer :exam_id
      t.integer :unit_id
      t.integer :matter_id
      t.integer :user_id

      t.timestamps
    end
  end
end
