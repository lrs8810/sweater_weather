require 'rails_helper'

describe 'Background Image API', :vcr do
  it "it sends an image based on location" do
    WebMock.enable_net_connect!
    VCR.eject_cassette
    VCR.turn_off!(ignore_cassettes: true)

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    # response = response.body
  end
end
