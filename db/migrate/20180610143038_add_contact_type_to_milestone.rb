class AddContactTypeToMilestone < ActiveRecord::Migration[5.2]
  def change
    add_column :milestones, :contact_type, :string
  end
end
