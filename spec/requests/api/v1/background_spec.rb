require 'rails_helper'

describe 'Background Image API' do
  it "it sends an image based on location" do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    response = response.body
  end
end
