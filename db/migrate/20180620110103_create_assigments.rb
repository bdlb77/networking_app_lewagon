class CreateAssigments < ActiveRecord::Migration[5.2]
  def change
    create_table :assigments do |t|
      t.string :title
      t.boolean :completed, default: false
      t.references :milestone, foreign_key: true

      t.timestamps
    end
  end
end
