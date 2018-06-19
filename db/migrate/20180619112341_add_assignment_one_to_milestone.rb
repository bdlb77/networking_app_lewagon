class AddAssignmentOneToMilestone < ActiveRecord::Migration[5.2]
  def change
    add_column :milestones, :assigment_one, :string
  end
end
