class AddUserToWorks < ActiveRecord::Migration
  def change
    add_column :works, :user_id, :integer
    add_index :works, :user_id
  end
end
