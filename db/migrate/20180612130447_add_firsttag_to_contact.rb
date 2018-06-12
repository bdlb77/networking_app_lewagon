class AddFirsttagToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :first_tag, :string
  end
end
