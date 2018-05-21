class EditStatusColumns < ActiveRecord::Migration[5.1]
  def change
  	remove_column :answers, :status


  	add_column :answers, :status, :integer, default: 0
  end
end
