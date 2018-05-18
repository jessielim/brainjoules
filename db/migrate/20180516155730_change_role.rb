class ChangeRole < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :role, :integer, default: 0

  	add_column :users, :role, :string
  end
end
