class Student < ApplicationRecord
	belongs_to :teacher
	belongs_to :user
	has_many :pets
end