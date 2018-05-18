class StudentsController < Clearance::UsersController

 def search
 	if params[:query].present?
       
       @student = Student.search_by_name(params[:query])

       respond_to do |format|
          format.html
          format.json {render json: @student}
          format.js
         end
     end

 end


 def index
		@student = Student.all
	end

	def add_student
	 	@user = User.new
	 	@user.students.new
 	end

	def student_created
	 	@user = User.new(user_params)
	 	@user.students.new(student_params)

		    respond_to do |format|
		    
		      if @user.save
		      	flash[:notice] 
		        format.html { redirect_to "/", notice: 'Student was successfully created.' }
		        format.json 
		      else
		        format.html { redirect_to "/" , notice: 'Error'}
		        format.json 
		      end
		    end
	 end


 private

	 def user_params
      params.require(:user).permit(:email, :password, :role)
 	 end

 	 def student_params
      params.require(:student).permit(:name, :score, :token, :parents_contact)
	 end




end