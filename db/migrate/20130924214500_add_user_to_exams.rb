class AddUserToExams < ActiveRecord::Migration
  def change
    add_column :exams, :user_id, :integer
    add_index :exams, :user_id
  end
end
