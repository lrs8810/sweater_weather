class AntipodeFacade
  def initialize(location)
    @origin_geocode_data = GoogleGeocodeService.get_geocode(location)
    # @origin_geocode = Coordinates.new(@origin_geocode_data)
    @antipode = AmypodeService.get_antipode_lat_long(@origin_geocode.lat, @origin_geocode.long)
    @antipode_geocode = GoogleGeocodeService.get_reverse_geocode(@antipode[:lat], @antipode[:long])
    @forecast_details = DarkSkyService.get_forecast(@antipode[:lat], @antipode[:long])
  end

  def get_antipode_response
    Antipode.new(@antipode_geocode,@forecast_details, @origin_geocode)
  end

  def get_geocode_hash(@origin_geocode_data)
    # geocode_hash = {
    # city: google_json_data[:results][0][:address_components][0][:long_name],
    # lat: google_json_data[:results][0][:geometry][:location][:lat],
    # long: google_json_data[:results][0][:geometry][:location][:lng]
    # }
    # if google_json_data[:results][0][:address_components].length > 1
    #   geocode_hash[:state] = google_json_data[:results][0][:address_components][2][:short_name]
    #   geocode_hash[:country] = google_json_data[:results][0][:address_components][3][:long_name]
    # end
    # geocode_hash
  end


end
