require 'rails_helper'

RSpec.describe UnsplashService do
  it 'can get a background image', :vcr do
    data = UnsplashService.get_background('Denver, CO')
  end
end
