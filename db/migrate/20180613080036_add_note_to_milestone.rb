class AddNoteToMilestone < ActiveRecord::Migration[5.2]
  def change
    add_column :milestones, :note, :string
  end
end
