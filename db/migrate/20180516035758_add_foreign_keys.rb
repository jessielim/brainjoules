class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change

  	
	add_reference :teachers, :user, index:true
  	add_reference :students, :user, index:true
  	add_reference :students, :teacher, index:true
  	add_reference :pets, :student, index:true
  	add_reference :quizzes, :teacher, index:true
  	add_reference :questions, :quiz, index:true
  	add_reference :answers, :question, index:true
  	add_reference :quiz_results, :quiz, index:true
  	add_reference :quiz_results, :student, index:true

  end
end
