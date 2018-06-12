3class AddLocationToMilestones < ActiveRecord::Migration[5.2]
  def change
    add_reference :milestones, :location, foreign_key: true
  end
end
