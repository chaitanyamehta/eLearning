class ApplicationController < ActionController::Base
  helper_method :current_user_auth

  def current_user_auth
    if session[:user_auth_id]
      @current_user_auth ||= UserAuth.find(session[:user_auth_id])
    else
      @current_user_auth = nil
    end
  end
end
