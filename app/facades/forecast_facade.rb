class ForecastFacade
  def initialize(location)
    @geocode = GoogleService.get_geo_json(location)
    @forecast_details = DarkSkyService.get_forecast(@geocode[:lat], @geocode[:long])
  end

  def get_forecast_details
    Forecast.new(@geocode, @forecast_details)
  end
end
