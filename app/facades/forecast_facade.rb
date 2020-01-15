class ForecastFacade
  def initialize(location)
    @geocode_json = GoogleService.get_geo_json(location)
    @coords = CoordinateFormatter.new(@geocode_json)
    @forecast_json = DarkSkyService.get_forecast(@coords.lat, @coords.long)
  end

  def get_forecast_details
    Forecast.new(@geocode_json, @forecast_json)
  end
end
