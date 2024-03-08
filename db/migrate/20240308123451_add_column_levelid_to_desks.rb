class AddColumnLevelidToDesks < ActiveRecord::Migration[7.1]
  def change
    add_reference :desks, :level, foreign_key: true
  end
end
