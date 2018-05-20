class DropTable < ActiveRecord::Migration[5.1]
  def change
  	
  	drop_table :game_rooms

  	create_table :rooms do |t|

    	t.string :room_id
  
  end
end
end
