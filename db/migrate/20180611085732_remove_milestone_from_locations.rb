class RemoveMilestoneFromLocations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :locations, :milestone, foreign_key: true
  end
end
