class User < ApplicationRecord
	include Clearance::User
  has_many :teachers
  has_many :students
  belongs_to :room, optional: true

  enum role: [:admin, :teacher, :student]

  def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     email: auth_hash["info"]["email"],
     password: SecureRandom.hex(10)
   )
   user.authentications << authentication
   return user
 end
 
end
