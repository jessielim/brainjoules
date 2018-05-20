class CreateRoomColumn < ActiveRecord::Migration[5.1]
  def change
    create_table :room_columns do |t|
    	add_column :users, :room_id, :string
    end
  end
end
