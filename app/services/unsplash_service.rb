class UnsplashService
  def self.get_background(location)
    location = "#{location}"
    response = connection(location).get.body

    unsplash_json_data = JSON.parse(response, symbolize_names: true)
  end

  private

    def self.connection(location)
      Faraday.new('https://api.unsplash.com/search/photos') do |faraday|
        faraday.params['client_id'] = ENV['UNSPLASH_API_KEY']
        faraday.params['query'] = location
        # faraday.params['orientation'] = 'landscape'
        faraday.adapter Faraday.default_adapter
      end
    end

end
