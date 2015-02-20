class MainController < ApplicationController
  def show
    redirect_to profile_path(current_user) if current_user
  end
end
