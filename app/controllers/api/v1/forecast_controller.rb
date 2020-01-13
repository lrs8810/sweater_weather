class Api::V1::ForecastController < ApplicationController

  def show
    forecast_facade = ForecastFacade.new(params[:location])
    data = forecast_facade.get_forecast_details
    render json: ForecastSerializer.new(data)
  end

end
