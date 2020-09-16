class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :require_logout, only: [:new, :create]

  def new
  end
  
  def create
    user_auth = UserAuth.find_by_email(params[:email])
    if user_auth && user_auth.authenticate(params[:password])
      session[:user_auth_id] = user_auth.id
      session[:impersonate_auth_id] = nil
      redirect_to root_url
    else
      flash.now[:alert] = "Entered email or password is invalid"
      render "new"
    end
  end

  def impersonate
    user_auth = UserAuth.find(params[:user_auth_id])
    session[:impersonate_auth_id] = user_auth.id
    redirect_to root_url
  end

  def stop_impersonate
    session[:impersonate_auth_id] = nil
    redirect_to root_url, notice: "Stopped Impersonating!"
  end

  def destroy
    session[:user_auth_id] = nil
    session[:impersonate_auth_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  private
    def require_logout
      redirect_to home_url, notice: 'Logout to login as new user' if logged_in?
    end
end
