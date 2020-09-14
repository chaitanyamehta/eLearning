class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end
  
  def create
    user_auth = UserAuth.find_by_email(params[:email])
    if user_auth && user_auth.authenticate(params[:password])
      session[:user_auth_id] = user_auth.id
      redirect_to root_url
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
