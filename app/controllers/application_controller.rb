class ApplicationController < ActionController::Base
  helper_method :current_user_auth

  def current_user_auth
    if session[:user_auth_id]
      @current_user_auth ||= UserAuth.find(session[:user_auth_id])
    else
      @current_user_auth = nil
    end
  end

  def current_user
    unless current_user_auth.nil?
      @current_user ||= current_user_auth.authenticable
    else
      @current_user = nil
    end
  end

  def logged_in?       
    !current_user_auth.nil?
  end
end
