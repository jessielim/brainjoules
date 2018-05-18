class DropColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column :students, :parents_email
  end
end
