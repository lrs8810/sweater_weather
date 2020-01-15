require 'rails_helper'

RSpec.describe UnsplashService do
  it 'can get a background image', :vcr do
    data = UnsplashService.get_background_json('Denver, CO')
  end
end
