class AddLastLocationToMilestone < ActiveRecord::Migration[5.2]
  def change
    add_column :milestones, :last_location, :string
  end
end
