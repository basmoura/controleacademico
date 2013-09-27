class AddUserToSections < ActiveRecord::Migration
  def change
    add_column :sections, :user_id, :integer
    add_index :sections, :user_id
  end
end
