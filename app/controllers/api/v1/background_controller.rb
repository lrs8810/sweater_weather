class Api::V1::BackgroundController < ApplicationController
  def show
    background_facade = BackgroundFacade.new(location_params)
    background = background_facade.get_background
    render json: BackgroundSerializer.new(background)
  end

  private
  
  def location_params
    params.permit(:location)
  end
end
