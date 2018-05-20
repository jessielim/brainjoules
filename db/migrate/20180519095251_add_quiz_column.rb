class AddQuizColumn < ActiveRecord::Migration[5.1]
  def change
  	add_column :rooms, :quiz_id, :integer
  
  end
end
