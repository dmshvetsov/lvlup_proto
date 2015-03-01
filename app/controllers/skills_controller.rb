class SkillsController < ApplicationController
  before_action :authenticate

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.create_with(permited_params).find_or_create_by(title: params[:skill][:title])
    if @skill.errors.any?
      render 'new'
    else
      @skill.profiles << current_user
      redirect_to profile_edit_path(current_user)
    end
  end

  private

  def permited_params
    params.require(:skill).permit(:title)
  end
end
