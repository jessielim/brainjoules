class TeachersController < Clearance::UsersController
	def index
		@teacher = Teacher.all
	end


 	def search
	 	if params[:query].present?
	       
	       @teacher_s = Teacher.search_teacher(params[:query])
	       @teacher = Teacher.search_by_name(params[:query])

	       respond_to do |format|
	          format.html
	          format.json {render json: @teacher_s}
	          format.js
	         end
	     end

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

	 def destroy
	   	@teacher= Teacher.find(params[:id])
	   	user = User.all
	 	  	if current_user.id == @listing.user_id || current_user.admin?
	            @listing.destroy
	            respond_to do |format|
	            format.js 
	   		    format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
	   		    format.json { head :no_content }
	 		   	end
	 		else
	 		 	flash[:notice]
	 		    return redirect_to listings_url,notice: 'Sorry. You are not allowed to perform this action'
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