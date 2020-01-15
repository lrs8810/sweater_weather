class ForecastFacade
  def initialize(location)
    @geocode_json_data = GoogleService.get_geo_json(location)
    @coords = CoordinateFormatter.new(@geocode_json_data)
    @forecast_json_data = DarkSkyService.get_forecast(@coords.lat, @coords.long)
  end

  def forecast_object
    Forecast.new(geocode_city_info, @forecast_json_data)
  end

  private

  def geocode_city_info
    CityInfoFormatter.new(@geocode_json_data)
  end
end
