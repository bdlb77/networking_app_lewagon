class RemoveNotesFromMilestone < ActiveRecord::Migration[5.2]
  def change
    remove_column :milestones, :notes, :string
  end
end
