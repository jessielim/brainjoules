class TeachersController < Clearance::UsersController
	def index
		@teacher = Teacher.all
	end

	
  

end