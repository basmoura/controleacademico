class AddUserToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :user_id, :integer
    add_index :subjects, :user_id
  end
end
