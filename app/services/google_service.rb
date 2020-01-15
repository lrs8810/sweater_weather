class GoogleService
  def self.get_geo_json(location)
    response = connection.get do |faraday|
      faraday.params['address'] = location
    end

    parse_json(response)
  end

  def self.get_reverse_geo_json(lat, long)
    response = connection.get do |faraday|
      faraday.params['latlng'] = "#{lat},#{long}"
    end

    parse_json(response)
  end

  def self.get_directions_json(origin, destination)
    type = 'directions'

    response = self.connection(type).get do |f|
      f.params['origin'] = origin
      f.params['destination'] = destination
    end

    parse_json(response)
  end

  private

  def self.connection(type = 'geocode')
    Faraday.new("https://maps.googleapis.com/maps/api/#{type}/json") do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
