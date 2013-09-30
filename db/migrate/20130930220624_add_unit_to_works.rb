class AddUnitToWorks < ActiveRecord::Migration
  def change
    add_column :works, :unit_id, :integer
    add_index :works, :unit_id
  end
end
