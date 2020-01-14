class Antipode
  attr_reader :id,
              :location_name,
              :forecast,
              :search_location

  def initialize(antipode, forecast_details, origin)
    @id = '1'
    @location_name = antipode[:city]
    @forecast = AntipodeForecast.new(forecast_details)
    @search_location = origin[:city]
  end
end
