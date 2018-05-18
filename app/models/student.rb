class Student < ApplicationRecord
	include PgSearch
	belongs_to :teacher
	belongs_to :user
	has_many :pets
	pg_search_scope :search_by_name, :against => :name
	

	def self.search_student(query)
		where("name ILIKE :name", name: "%#{query}%").map do |record|
			record.name
		end
	end
end