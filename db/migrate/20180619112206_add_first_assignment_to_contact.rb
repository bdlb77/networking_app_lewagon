class AddFirstAssignmentToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :first_assigment, :string
  end
end
