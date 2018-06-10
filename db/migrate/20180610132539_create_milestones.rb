class CreateMilestones < ActiveRecord::Migration[5.2]
  def change
    create_table :milestones do |t|
      t.string :notes
      t.string :type
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
