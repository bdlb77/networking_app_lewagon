class RemoveFirstNoteFromContact < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :first_note, :string
  end
end
