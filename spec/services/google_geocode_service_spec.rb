require 'rails_helper'

RSpec.describe GoogleService do
  it 'can get latitude and longitude of location', :vcr do
    json_data = GoogleService.get_geo_json('hongkong')

    expect(json_data).to have_key(:results)

    nested_keys = json_data[:results][0]

    expect(nested_keys).to have_key(:address_components)
    expect(nested_keys).to have_key(:formatted_address)
    expect(nested_keys).to have_key(:geometry)
    expect(nested_keys).to have_key(:place_id)
    expect(nested_keys).to have_key(:types)
  end

  it 'can get the reverse lat and long of a location', :vcr do
    json_data = GoogleService.get_reverse_geo_json(-22.3193039,-65.8306389)

    expect(json_data).to have_key(:plus_code)
    expect(json_data).to have_key(:results)
    expect(json_data).to have_key(:status)
  end
end
