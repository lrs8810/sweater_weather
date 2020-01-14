class GoogleGeocodeService
  def self.get_geocode(location)
    response = connection.get do |faraday|
      faraday.params['address'] = location
    end

    google_json_data = JSON.parse(response.body, symbolize_names: true)

    geocode_hash = {
    city: google_json_data[:results][0][:address_components][0][:long_name],
    lat: google_json_data[:results][0][:geometry][:location][:lat],
    long: google_json_data[:results][0][:geometry][:location][:lng]
    }
    if google_json_data[:results][0][:address_components].length > 1
      geocode_hash[:state] = google_json_data[:results][0][:address_components][2][:short_name]
      geocode_hash[:country] = google_json_data[:results][0][:address_components][3][:long_name]
    end 
    geocode_hash
  end

  def self.get_reverse_geocode(lat, long)
    response = connection.get do |faraday|
      faraday.params['latlng'] = "#{lat},#{long}"
    end

    google_json_data = JSON.parse(response.body, symbolize_names: true)

    geocode_hash = {
      city: google_json_data[:results][0][:address_components][1][:long_name]
    }
    geocode_hash
  end

  private

    def self.connection
      Faraday.new('https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
        faraday.params['key'] = ENV['GOOGLE_API_KEY']
        faraday.adapter Faraday.default_adapter
      end
    end

end
