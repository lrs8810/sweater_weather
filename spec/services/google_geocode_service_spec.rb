require 'rails_helper'

RSpec.describe GoogleGeocodeService do
  it 'can get latitude and longitude of location', :vcr do
    data = GoogleGeocodeService.get_geocode('Denver,CO')
  end
end
