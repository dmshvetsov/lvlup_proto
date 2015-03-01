class CharacteristicsController < ApplicationController
  def show
    @characteristic = Characteristic.find(params[:id])
    @page_title = @characteristic.title
  end
end
