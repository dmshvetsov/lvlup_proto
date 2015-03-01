class ProfilesController < ApplicationController
  before_action :authenticate, only: [:edit]

  def show
    @profile = Profile.find(params[:id])
    @page_title = @profile.nickname
  end

  def edit
    @profile = Profile.find(current_user)
  end
end
