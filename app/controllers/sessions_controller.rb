class SessionsController < ApplicationController
  def create
    user = Profile.find_or_create_from_auth_hash(auth_hash)
    self.current_user = user
    redirect_to profile_edit_path(user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
