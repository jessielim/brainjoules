class CreateGameRoom < ActiveRecord::Migration[5.1]
  def change
    create_table :game_rooms do |t|

    	t.string :room_id
    end
  end
end
