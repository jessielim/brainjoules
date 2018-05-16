class Teacher < ApplicationRecord
	has_many :students
	has_many :quizzes
	belongs_to :user
end
