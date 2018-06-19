class AddSecondAssignmentToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :second_assigment, :string
  end
end
