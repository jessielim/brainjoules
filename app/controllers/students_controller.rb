class StudentsController < Clearance::UsersController

 def search
 	if params[:query].present?
       
       @pupil = Student.search_student(params[:query])
       @student = Student.search_by_name(params[:query])

       respond_to do |format|
          format.html
          format.json {render json: @pupil}
          format.js
         end
     end

 end


 def index
 	if current_user.teacher?
		@teacher = Teacher.find_by(user_id: current_user.id)
	 	@student = Student.where(teacher_id: @teacher.id)
 	else
 		@teacher = Teacher.all
 		@student = Student.all
 	end

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

  def destroy
	   	@student= Student.find(params[:id])
	   	user = User.all
	 	  	if current_user.admin?
	            @student.destroy
	            respond_to do |format|
	            format.js 
	   		    format.html { redirect_to find_a_student_url, notice: 'Teacher was successfully destroyed.' }
	   		    format.json { head :no_content }
	 		   	end
	 		else
	 		 	flash[:notice]
	 		    return redirect_to find_a_student_url,notice: 'Sorry. You are not allowed to perform this action'
	 		end
  end

  def edit
  	@student= Student.find(params[:id])
  	
  end

  def update
  	@student= Student.find(params[:id])
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to "/search_student", notice: 'Student was successfully updated.' }
        format.json 
      else
        format.html { redirect_to "/search_student", notice: 'Error.' }
        format.json 
      end
    end
  end

 





private
    def user_params
      params.require(:user).permit(:email, :password, :role)
    end


 	def student_params
      params.require(:student).permit(:name, :score, :token, :parents_contact, :teacher_id,:parents_email)
	 end



end