class RemoveTypeFromMilestone < ActiveRecord::Migration[5.2]
  def change
    remove_column :milestones, :type, :string
  end
end
