require 'rails_helper'

describe 'Forecast API', :type => :request do
  it "it sends all the forecast details for a city", :vcr do
    WebMock.enable_net_connect!
    VCR.eject_cassette
    VCR.turn_off!(ignore_cassettes: true)

    get '/api/v1/forecast?location=denver,co'

    last_response = response

    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body, symbolize_names: true)

    response_attributes = json[:data][:attributes]

    expect(response_attributes).to have_key(:current_weather)
    expect(response_attributes).to have_key(:current_weather_details)
    expect(response_attributes).to have_key(:hourly_forecast)
    expect(response_attributes).to have_key(:daily_forecast)
  end
end
