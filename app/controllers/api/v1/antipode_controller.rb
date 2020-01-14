class Api::V1::AntipodeController < ApplicationController

  def show
    antipode_facade = AntipodeFacade.new(params[:location])
    antipode = antipode_facade.get_antipode_response
    render json: AntipodeSerializer.new(antipode)
  end
end
