class RenameMatteridCourseid < ActiveRecord::Migration
  def change
    rename_column :works, :matter_id, :course_id
    rename_column :exams, :matter_id, :course_id
  end
end
