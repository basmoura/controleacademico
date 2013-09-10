class AddColumnFinalDtToWorks < ActiveRecord::Migration
  def change
  	add_column :works, :final_dt, :datetime
  end
end
