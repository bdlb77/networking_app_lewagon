class AddFirstContactTypeToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :first_contact_type, :string
  end
end
