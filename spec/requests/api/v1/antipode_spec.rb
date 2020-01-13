require 'rails_helper'

describe 'Antipode API' do
  it "it sends a resonse with the antipode city's info" do

    get '/api/v1/antipode?location=hongkong'

    expect(response).to be_successful
    #
    # response = response.body
  end
end
