class LvlupsController < ApplicationController
  def new
    @lvlup = Lvlup.new
    skill = Skill.find_by_title!(params[:skill_title])
    @characteristic_id = Characteristic.where(profile_id: current_user.id, skill_id: skill.id).first.id
  end

  def create
    @lvlup = Lvlup.new(permited_params)
    if @lvlup.save
      redirect_to profile_path(current_user)
    else
      render 'new'
    end
  end

  private

  def permited_params
    params.require(:lvlup).permit(:description, :characteristic_id)
  end
end
