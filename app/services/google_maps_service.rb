class GoogleMapsService
  def self.get_json(origin, destination)
    response = self.connection.get do |f|
      f.params['origin'] = origin
      f.params['destination'] = destination
    end
    
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def self.connection
    Faraday.new('https://maps.googleapis.com/maps/api/directions/json') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
