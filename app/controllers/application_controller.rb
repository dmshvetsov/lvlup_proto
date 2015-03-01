class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= Profile.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    redirect_to root_path unless current_user
  end

  helper_method :current_user
end
