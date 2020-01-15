class RoadTripFacade
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(info)
    @id = 1.to_s
    @origin = info[:origin]
    @destination = info[:destination]
    @map_json = GoogleMapsService.get_json(@origin, @destination)
    @travel_time = travel_time
    @arrival_forecast = arrival_forecast
  end

  def travel_time
    @map_json[:routes][0][:legs][0][:duration][:text]
  end

  def arrival_forecast
    geocode_json_data = GoogleGeocodeService.get_geocode(@destination)
    coords = GeocodeFormatter.new(geocode_json_data)
    weather_json_data = DarkSkyService.get_forecast(coords.lat, coords.long)
    ForecastFormatter.new(weather_json_data)
  end
end
