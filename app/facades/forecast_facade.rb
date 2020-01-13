class ForecastFacade
  def initialize(location)
    @geocode ||= GoogleGeocodeService.get_geocode(location)
    @forecast_details ||= DarkSkyService.get_forecast(@geocode[:lat], @geocode[:lng])
  end

  def get_forecast_details
    Forecast.new(@geocode, @forecast_details)
  end
end
