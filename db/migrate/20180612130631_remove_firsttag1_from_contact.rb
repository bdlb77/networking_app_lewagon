class RemoveFirsttag1FromContact < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :first_tag1, :string
  end
end
