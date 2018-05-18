class AddExtraForeignKeys < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :teachers, :users
  	add_foreign_key :students, :users
  	add_foreign_key :students, :teachers
  	add_foreign_key :pets, :students
  	add_foreign_key :quizzes, :teachers
  	add_foreign_key :questions, :quizzes
  	add_foreign_key :answers, :questions
  	add_foreign_key :quiz_results, :quizzes
  	add_foreign_key :quiz_results, :students
  end
  
end
