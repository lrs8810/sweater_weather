class Api::V1::ForecastController < ApplicationController
  def show
    forecast_facade = ForecastFacade.new(location_params)
    forecast = forecast_facade.forecast_object
    render json: ForecastSerializer.new(forecast)
  end

  private

  def location_params
    params.permit(:location)
  end
end
