class SessionsController < ApplicationController
  def new
  end
  
  def create
    user_auth = UserAuth.find_by_email(params[:email])
    if user_auth && user_auth.authenticate(params[:password])
      session[:user_auth_id] = user_auth.id
      #byebug
      if current_user_type == "Admin"
        redirect_to admin_home_url
      elsif current_user_type == "Student"
        redirect_to student_home_url
      elsif current_user_type == "Teacher"
        redirect_to teacher_home_url
      end
    else
      flash.now[:alert] = "Entered email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_auth_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
