require 'rails_helper'

describe 'User Road Trip API' do
  it 'a registered user can find a road trip forecast' do
    WebMock.enable_net_connect!
    VCR.eject_cassette
    VCR.turn_off!(ignore_cassettes: true)
    
    user = User.create(email: 'whatever@example.com',
                password: 'password',
                password_confirmation: 'password')

    road_trip_params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": "#{user.api_key}"
    }

    post "/api/v1/road_trip", params: road_trip_params.to_json

    last_response = response

    expect(last_response.status).to eq(200)

    response_body = JSON.parse(last_response.body, symbolize_names: true)

    expect(response_body[:data][:attributes]).to have_key(:origin)
    expect(response_body[:data][:attributes]).to have_key(:destination)
    expect(response_body[:data][:attributes]).to have_key(:travel_time)
    expect(response_body[:data][:attributes]).to have_key(:arrival_forecast)
  end
end
