class Quiz <ApplicationRecord
	belongs_to :teacher
	has_many :questions
end