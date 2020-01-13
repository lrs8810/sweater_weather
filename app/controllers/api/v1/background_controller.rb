class Api::V1::BackgroundController < ApplicationController

  def show
    background_facade = BackgroundFacade.new(params[:location])
    data = background_facade.get_background
    render json: BackgroundSerializer.new(data)
  end

end
