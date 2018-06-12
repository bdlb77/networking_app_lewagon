class AddFirstLocationToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :first_location, :string
  end
end
