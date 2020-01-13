class Api::V1::BackgroundController < ApplicationController

  def show
    background_facade = BackgroundFacade.new(params[:location])
    render json: BackgroundSerializer.new(background_facade)
  end

end
