class Room < ApplicationRecord
  require 'securerandom'
  belongs_to :quiz
	has_many :users, dependent: :nullify
  before_save :make_id
   
   def make_id
    self.room_id = SecureRandom.hex(2)
   end
   
 
end