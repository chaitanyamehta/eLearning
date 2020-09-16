class ApplicationController < ActionController::Base
  NOT_AUTHORIZED = 'Not Authorized: Action could not be performed'

  before_action :require_login
  helper_method :logged_in_user_auth
  helper_method :current_user_auth
  helper_method :current_user
  helper_method :logged_in?
  helper_method :impersonating?
  helper_method :is_admin?
  helper_method :is_teacher?
  helper_method :is_student?
  helper_method :is_student_login?

  def logged_in_user_auth
    if session[:user_auth_id]
      @logged_in_user_auth ||= UserAuth.find(session[:user_auth_id])
    end
  end

  def logged_in_user_type
    unless logged_in_user_auth.nil?
      @logged_in_user_type ||= logged_in_user_auth.authenticable_type
    end
  end

  def current_user_auth
    if session[:impersonate_auth_id]
      @current_user_auth ||= UserAuth.find(session[:impersonate_auth_id])
    else
      @current_user_auth ||= logged_in_user_auth;
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

  def logged_in?       
    !session[:user_auth_id].nil?
  end

  def impersonating?
    !session[:impersonate_auth_id].nil?
  end

  def require_login
    redirect_to login_url unless logged_in?
  end

  def require_admin
    redirect_to home_url, notice: NOT_AUTHORIZED unless is_admin?
  end

  def require_teacher
    redirect_to home_url, notice: NOT_AUTHORIZED unless is_teacher?
  end

  def require_student
    redirect_to home_url, notice: NOT_AUTHORIZED unless is_student?
  end

  def require_admin_or_teacher
    redirect_to home_url, notice: NOT_AUTHORIZED unless is_admin? or is_teacher?
  end

  def require_student_login
    redirect_to home_url, notice: NOT_AUTHORIZED unless is_student_login?
  end
  
  def is_admin?
    current_user_type == 'Admin'
  end

  def is_teacher?
    current_user_type == 'Teacher'
  end

  def is_student?
    current_user_type == 'Student'
  end

  def is_admin_login?
    logged_in_user_type == 'Admin'
  end

  def is_student_login?
    logged_in_user_type == 'Student'
  end
end
