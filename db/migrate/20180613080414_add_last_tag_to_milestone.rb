class AddLastTagToMilestone < ActiveRecord::Migration[5.2]
  def change
    add_column :milestones, :last_tag, :string
  end
end
