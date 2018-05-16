class CreateQuizResults < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_results do |t|
    	t.timestamps null: false
    end
  end
end
