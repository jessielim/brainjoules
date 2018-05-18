class ChangeContact < ActiveRecord::Migration[5.1]
  def change
  	remove_column :students, :parents_contact

  	add_column :students, :parents_contact, :string
  end
end
