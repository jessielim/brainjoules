class AddQuizResultsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :quizresults do |t|
  		t.timestamps null: false
  	end

  	add_reference :quizresults, :quiz, foreign_key: true
  	add_reference :quizresults, :student, foreign_key: true
  end
end
