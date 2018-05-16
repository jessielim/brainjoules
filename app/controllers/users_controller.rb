class UsersController < Clearance::UsersController



 def edit
    @user= current_user
 end

 def update
    @user = current_user
    @user.update(permit_params)

    # redirect_to profile_path

 end

 def user_from_params
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
  	end
 end





 def user_params
    params.require(:user).permit(:email, :password, :role)
 end

 private

 def teacher_params
      params.require(:teacher).permit(:name, :phone_number)
 end

end







