class AddSecondtagToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :second_tag, :string
  end
end
