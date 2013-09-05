class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :name
      t.string :teacher
      t.integer :credits

      t.timestamps
    end
  end
end
