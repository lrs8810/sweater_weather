class Forecast
  attr_reader :id, :results

  def initialize(geocode_hash, forecast_details_hash)
    @id = '1'
    results = {}
    results[:current_temp] = []

    # box 1
    upper_left = {
    date: Time.at(forecast_details_hash[:currently][:time]).to_date,
    time: Time.at(forecast_details_hash[:currently][:time]).to_time,
    current_temp: forecast_details_hash[:currently][:temperature],
    summary: forecast_details_hash[:currently][:summary],
    icon: forecast_details_hash[:currently][:icon],
    # high_temp =
    # low_temp =
    city: geocode_hash[:city],
    state: geocode_hash[:state],
    country: geocode_hash[:country]
    }
    results[:current_temp] << upper_left
    #box 2
    upper_right = {
    summary: forecast_details_hash[:currently][:summary],
    apparent_temp: forecast_details_hash[:currently][:apparentTemperature],
    humidity: forecast_details_hash[:currently][:humidity],
    visibility: forecast_details_hash[:currently][:visibility],
    uv_index: forecast_details_hash[:currently][:uvIndex],
    icon: forecast_details_hash[:currently][:icon]
    }
    results[:current_temp] << upper_right
    #box 3
    results[:hourly_daily] = {}
    results[:hourly_daily][:hourly] = forecast_details_hash[:hourly][:data].take(8).inject([]) do |array, hour|
      hash = {
        time: Time.at(hour[:time]).to_time,
        temp: hour[:temperature]
      }
      array << hash
    end
    results[:hourly_daily][:daily] = forecast_details_hash[:daily][:data].take(5).inject([]) do |array, day|
      hash = {
        date: Time.at(day[:time]).to_date,
        icon: day[:icon],
        precip_probability: day[:precipProbability],
        precip_type: day[:precipType],
        temp_high: day[:temperatureHigh],
        temp_low: day[:temperatureLow]
      }
      array << hash
    end
    @results = results
  end
end
