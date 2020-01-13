require 'rails_helper'

RSpec.describe DarkSkyService do
  it 'can get forecast', :vcr do
    data = DarkSkyService.get_forecast(39.7392358, -104.990251)
  end
end
