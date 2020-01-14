require 'rails_helper'

describe 'Antipode API' do
  it "it sends a resonse with the antipode city's info", :vcr do

    get '/api/v1/antipode?location=hongkong'

    last_response = response

    expect(last_response.status).to eq(200)

    json = JSON.parse(last_response.body, symbolize_names: true)

    expect(json[:data][:attributes].length).to eq(3)

    expect(json[:data][:attributes][:forecast].length).to eq(2)
  end
end
