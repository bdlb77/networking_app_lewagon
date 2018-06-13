class AddOneNoteToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :one_note, :string
  end
end
