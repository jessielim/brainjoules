class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column :teachers, :phone_number

  	add_column :teachers, :phone_number, :string
  end
end
