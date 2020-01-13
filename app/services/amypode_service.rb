class AmypodeService
  def self.get_antipode_lat_long(lat, long)
    response = connection(lat, long).get.body

    json_response = JSON.parse(response, symbolize_names: true)

    json_response[:data][:attributes]
  end

  private

    def self.connection(lat, long)
      Faraday.new("http://amypode.herokuapp.com/api/v1/antipodes") do |faraday|
        faraday.params['lat'] = lat
        faraday.params['long'] = long
        faraday.headers['api_key'] = ENV['AMYPODE_API_KEY']
        faraday.adapter Faraday.default_adapter
      end
    end

end
