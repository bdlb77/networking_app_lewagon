class RemoveFirsttagsFromContact < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :first_tags, :text
  end
end
