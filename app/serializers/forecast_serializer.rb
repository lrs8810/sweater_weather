class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :current_weather,
             :current_weather_details,
             :hourly_forecast,
             :daily_forecast
end
