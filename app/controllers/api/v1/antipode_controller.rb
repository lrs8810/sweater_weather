class Api::V1::AntipodeController < ApplicationController

  def show
    antipode_facade = AntipodeFacade.new(params[:location])
    background = antipode_facade.get_antipode_response
    # render json: BackgroundSerializer.new(background)
  end

end
