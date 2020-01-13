require 'rails_helper'

describe 'Forecast API' do
  it "it sends all the forecast details for a city" do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    # response = response.body
  end
end
