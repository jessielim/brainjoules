class TeachersController < Clearance::UsersController
	def index
		@teacher = Teacher.all
	end

	def add_teacher
	 	@user = User.new
	 	@user.teachers.new
 	end

	def teacher_created
	 	@user = User.new(user_params)
	 	@user.teachers.new(teacher_params)

		    respond_to do |format|
		    
		      if @user.save
		      	flash[:notice] 
		        format.html { redirect_to "/", notice: 'Teacher was successfully created.' }
		        format.json 
		      else
		        format.html { redirect_to "/", notice: 'Error' }
		        format.json 
		      end
		    end
	 end


 private

	 def user_params
      params.require(:user).permit(:email, :password, :role)
 	 end

 	 def teacher_params
      params.require(:teacher).permit(:name, :phone_number)
	 end


	
  

end