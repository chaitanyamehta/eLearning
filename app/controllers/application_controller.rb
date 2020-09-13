class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_auth_id]
      @current_user ||= UserAuth.find(session[:user_auth_id]).authenticable
    else
      @current_user = nil
    end
  end
end
