require 'rails_helper'

RSpec.describe AmypodeService do
  it 'can get antipode latitude and longitude', :vcr do
    data = AmypodeService.get_antipode_lat_long(22.3193039, 114.1693611)

    expect(data.keys).to eq([:lat, :long])
    expect(data.values.length).to eq(2)
  end
end
