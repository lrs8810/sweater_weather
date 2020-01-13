class GoogleGeocodeService
  def self.get_geocode(location)
    response = connection(location).get.body

    google_json_data = JSON.parse(response, symbolize_names: true)
    
    geocode_hash = {}
    geocode_hash[:city] = google_json_data[:results][0][:address_components][0][:long_name]
    geocode_hash[:state] = google_json_data[:results][0][:address_components][2][:short_name]
    geocode_hash[:country]= google_json_data[:results][0][:address_components][3][:long_name]
    geocode_hash[:lat] = google_json_data[:results][0][:geometry][:location][:lat]
    geocode_hash[:lng] = google_json_data[:results][0][:geometry][:location][:lng]
    geocode_hash
  end

  private

    def self.connection(location)
      Faraday.new('https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
        faraday.params['key'] = ENV['GOOGLE_API_KEY']
        faraday.params['address'] = location
        faraday.adapter Faraday.default_adapter
      end
    end

end
