class MainController < ApplicationController
  def show
    redirect_to profile_edit_path(current_user) if current_user
  end
end
