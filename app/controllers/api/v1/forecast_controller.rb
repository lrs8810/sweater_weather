class Api::V1::ForecastController < ApplicationController
  def show
    forecast_facade = ForecastFacade.new(location_params)
    data = forecast_facade.get_forecast_details
    render json: ForecastSerializer.new(data)
  end

  private
  
  def location_params
    params.permit(:location)
  end
end
