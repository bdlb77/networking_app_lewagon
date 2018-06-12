class AddFirsttagsToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :first_tags, :text, array:true, default: []
  end
end
