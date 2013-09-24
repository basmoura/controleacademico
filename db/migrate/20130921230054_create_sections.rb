class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :description
      t.decimal :grade
      t.boolean :done
      t.integer :work_id

      t.timestamps
    end
  end
end
