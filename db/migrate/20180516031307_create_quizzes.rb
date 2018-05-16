class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
    	t.string :title
    	t.integer :code
    	t.timestamps null: false
    end
  end
end
