class CharacteristicsController < ApplicationController
  before_action :authenticate

  def show
    @characteristic = Characteristic.find(params[:id])
    @page_title = @characteristic.title
  end
end
