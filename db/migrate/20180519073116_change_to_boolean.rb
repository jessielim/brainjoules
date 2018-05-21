class ChangeToBoolean < ActiveRecord::Migration[5.1]
  def change
  	remove_column :answers, :status

  	add_column :answers, :status, :boolean , default: false
  end
end
