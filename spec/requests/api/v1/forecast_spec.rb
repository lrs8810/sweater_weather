require 'rails_helper'

describe 'Forecast API', :type => :request do
  it "it sends all the forecast details for a city", :vcr do
    get '/api/v1/forecast?location=denver,co'

    last_response = response

    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body, symbolize_names: true)

    expect(json[:data][:attributes][:results].length).to eq(2)

    expect(json[:data][:attributes][:results][:current_temp].length).to eq(2)

    expect(json[:data][:attributes][:results][:hourly_daily].length).to eq(2)

    expect(json[:data][:attributes][:results][:hourly_daily][:hourly].length).to eq(8)

    expect(json[:data][:attributes][:results][:hourly_daily][:daily].length).to eq(5)
  end
end
