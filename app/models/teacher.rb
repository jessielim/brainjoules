class Teacher < ApplicationRecord
	include PgSearch
	has_many :students
	has_many :quizzes
	belongs_to :user
	pg_search_scope :search_by_name, :against => :name
	

	def self.search_teacher(query)
		where("name ILIKE :name", name: "%#{query}%").map do |record|
			record.name
		end
	end
end
