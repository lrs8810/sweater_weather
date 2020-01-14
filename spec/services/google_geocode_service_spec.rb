require 'rails_helper'

RSpec.describe GoogleGeocodeService do
  it 'can get latitude and longitude of location', :vcr do
    data = GoogleGeocodeService.get_geocode('hongkong')

    expect(data.keys).to eq([:city, :lat, :long])
    expect(data.values.length).to eq(3)
  end

  it 'can get the reverse lat and long of a location', :vcr do
    data = GoogleGeocodeService.get_reverse_geocode(-22.3193039,-65.8306389)

    expect(data.keys).to eq([:city])
    expect(data.values.length).to eq(1)
  end
end
