class AddFirstNoteToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :first_note, :string
  end
end
