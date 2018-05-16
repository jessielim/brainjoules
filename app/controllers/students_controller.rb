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




end