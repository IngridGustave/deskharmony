class CreateDesks < ActiveRecord::Migration[7.1]
  def change
    create_table :desks do |t|
      t.string :name
      t.integer :level
      t.string :description

      t.timestamps
    end
  end
end
