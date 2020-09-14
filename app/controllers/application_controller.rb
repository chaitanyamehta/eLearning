class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user_auth

  def current_user_auth
    if session[:user_auth_id]
      @current_user_auth ||= UserAuth.find(session[:user_auth_id])
    end
  end

  def current_user
    unless current_user_auth.nil?
      @current_user ||= current_user_auth.authenticable
    end
  end

  def current_user_type
    unless current_user_auth.nil?
      @current_user_type ||= current_user_auth.authenticable_type
    end
  end

  def current_user_type
    unless current_user_auth.nil?
      @current_user_type ||= current_user_auth.authenticable_type
    end
  end

  def logged_in?       
    !current_user_auth.nil?
  end

  def require_login
    redirect_to login_url unless logged_in?
  end
end
