class Api::V1::BackgroundController < ApplicationController

  def show
    background_facade = BackgroundFacade.new(params[:location])
    background = background_facade.get_background
    render json: BackgroundSerializer.new(background)
  end

end
