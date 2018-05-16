class User < ApplicationRecord
  include Clearance::User
  has_many :teachers
  has_many :students

  enum role: [:admin, :teacher, :student]
end
