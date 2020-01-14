class Antipode
  attr_reader :id,
              :location_name,
              :forecast,
              :search_location

  def initialize(antipode, forecast_details, origin)
    @id = '1'
    @location_name = antipode[:city]
    @forecast = {
      summary: forecast_details[:currently][:summary],
      current_temperature: forecast_details[:currently][:temperature]
    }
    @search_location = origin[:city]
  end
end
