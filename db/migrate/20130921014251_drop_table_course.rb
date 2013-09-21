class DropTableCourse < ActiveRecord::Migration
  def change
    drop_table :course
  end
end
