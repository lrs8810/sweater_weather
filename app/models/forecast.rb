class Forecast
  attr_reader :id,
              :current_weather,
              :current_weather_details,
              :hourly_forecast,
              :daily_forecast

  def initialize(city_info, forecast_json)
    @id = 1.to_s
    @current = forecast_json[:currently]
    @hourly = forecast_json[:hourly][:data]
    @daily = forecast_json[:daily][:data]
    @timezone = forecast_json[:timezone]
    @city_info = city_info
    @current_weather = current_weather
    @current_weather_details = current_weather_details
    @hourly_forecast = format_hourly
    @daily_forecast = format_daily
  end

  def current_weather
    current_high = find_high
    current_low = find_low
    {
      summary: @current[:summary],
      icon: @current[:icon],
      current_temp: @current[:temperature],
      high_temp: current_high,
      low_temp: current_low,
      city: @city_info.city,
      state: @city_info.state,
      country: @city_info.country,
      time: format_current_date,
      date: format_current_time
    }
  end

  def current_weather_details
    tonight_sum = find_tonight_summary
    uv_indicator = calculate_uv(@current[:uvIndex])
    {
      icon: @current[:icon],
      today_summary: @current[:summary],
      tonight_summary: tonight_sum,
      apparent_temp: @current[:apparentTemperature],
      humidity: @current[:humidity],
      visibility: @current[:visibility],
      uv_index: @current[:uvIndex],
      uv_scale: uv_indicator
    }
  end

  def format_current_date
    ((Time.at(@current[:time]).to_date).in_time_zone(@timezone)).strftime("%m/%y")
  end

  def format_current_time
    ((Time.at(@current[:time]).to_time).in_time_zone(@timezone)).strftime("%l:%M %p")
  end

  def format_hourly
    @hourly.take(8).inject([]) do |array, hour|
      array << {
        time: ((Time.at(hour[:time]).to_time).in_time_zone(@timezone)).strftime("%l %p"),
        temp: hour[:temperature]
      }
      array
    end
  end

  def format_daily
    @daily.take(5).inject([]) do |array, day|
      array << {
        date: ((Time.at(day[:time]).to_date).in_time_zone(@timezone)).strftime("%A"),
        icon: day[:icon],
        precip_probability: day[:precipProbability],
        precip_type: day[:precipType],
        temp_high: day[:temperatureHigh],
        temp_low: day[:temperatureLow]
      }
      array
    end
  end

  def find_high
    today = @daily.first
    today[:temperatureHigh]
  end

  def find_low
    today = @daily.first
    today[:temperatureLow]
  end

  def find_tonight_summary
    eight_pm = @hourly.find do |day|
    (((Time.at(day[:time]).to_time).in_time_zone(@timezone)).strftime("%k")).to_i == 20
    end
    eight_pm[:icon]
  end

  def calculate_uv(uvindex)
    if uvindex.nil?
      'none'
    elsif uvindex <= 2
      'low'
    elsif uvindex.between?(3, 7)
      'moderate to high'
    else
      'very high to extreme'
    end
  end
end
