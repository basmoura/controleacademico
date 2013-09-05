class RenameColumnNameToTitleMattersTable < ActiveRecord::Migration
	def change
		rename_column :matters, :name, :title
	end
end
