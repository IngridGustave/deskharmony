class ChangeDescriptionToTextInDesks < ActiveRecord::Migration[7.1]
  def change
    change_column :desks, :description, :text
  end
end
