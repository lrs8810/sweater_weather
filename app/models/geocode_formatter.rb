class GeocodeFormatter
  attr_reader :lat,
              :long

  def initialize(json_data)
    @lat = json_data[:results][0][:geometry][:location][:lat]
    @long = json_data[:results][0][:geometry][:location][:lng]
  end

  # def self.format_coords(json_data)
  #   geocode_hash = {
  #   city: json_data[:results][0][:address_components][0][:long_name],
  #   lat: json_data[:results][0][:geometry][:location][:lat],
  #   long: json_data[:results][0][:geometry][:location][:lng]
  #   }
  #   if json_data[:results][0][:address_components].length > 1
  #     geocode_hash[:state] = json_data[:results][0][:address_components][2][:short_name]
  #     geocode_hash[:country] = json_data[:results][0][:address_components][3][:long_name]
  #   end
  #   geocode_hash
  # end
end
