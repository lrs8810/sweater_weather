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
    @directions_json = GoogleService.get_directions_json(@origin, @destination)
    @travel_time = travel_time
    @arrival_forecast = arrival_forecast
  end

  def travel_time
    @directions_json[:routes][0][:legs][0][:duration][:text]
  end

  def arrival_forecast
    geocode_json_data = GoogleService.get_geo_json(@destination)
    coords = CoordinateFormatter.new(geocode_json_data)
    weather_json_data = DarkSkyService.get_forecast(coords.lat, coords.long)
    ForecastFormatter.new(weather_json_data)
  end
end
