class AntipodeFacade
  def initialize(location)
    @origin_geocode = GoogleGeocodeService.get_geocode(location)
    @antipode = AmypodeService.get_antipode_lat_long(@origin_geocode[:lat], @origin_geocode[:long])
    @antipode_geocode = GoogleGeocodeService.get_reverse_geocode(@antipode[:lat], @antipode[:long])
    @forecast_details = DarkSkyService.get_forecast(@antipode[:lat], @antipode[:long])
  end

  def get_antipode_response
    Antipode.new(@antipode_geocode,@forecast_details, @origin_geocode)
  end
end
