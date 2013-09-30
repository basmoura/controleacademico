class AddUnitToExams < ActiveRecord::Migration
  def change
    add_column :exams, :unit_id, :integer
    add_index :exams, :unit_id
  end
end
