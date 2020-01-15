class CityInfoFormatter
  attr_reader :city,
              :state,
              :country

  def initialize(json_data)
    @city = json_data[:results][0][:address_components][0][:long_name]
    @state = json_data[:results][0][:address_components][2][:short_name]
    @country = json_data[:results][0][:address_components][3][:long_name]
  end
end
