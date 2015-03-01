class SkillsController < ApplicationController
  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.create_with(permited_params).find_or_create_by(title: params[:skill][:title])
    if @skill.errors.any?
      render 'new'
    else
      @skill.profiles << current_user
      redirect_to profile_path(current_user)
    end
  end

  def show
    @skill = Skill.find_by_title!(params[:title])
    @page_title = @skill.title
  end

  private

  def permited_params
    params.require(:skill).permit(:title)
  end
end
