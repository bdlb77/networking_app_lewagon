class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :company
      t.string :username
      t.string :email
      t.string :phone_number
      t.date :date_of_birth
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
