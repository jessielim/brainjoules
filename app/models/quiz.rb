class Quiz <ApplicationRecord
	include PgSearch
	belongs_to :teacher
	has_many :questions
	pg_search_scope :search_by_title, :against => :title

	def self.search_quiz(query)
		where("title ILIKE :title", title: "%#{query}%").map do |record|
			record.title
		end
	end
end