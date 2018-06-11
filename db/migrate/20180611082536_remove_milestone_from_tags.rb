class RemoveMilestoneFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tags, :milestone, foreign_key: true
  end
end
