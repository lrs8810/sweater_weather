class UnsplashService
  def self.get_background_json(location)
    response = connection(location).get.body

    json_data = JSON.parse(response, symbolize_names: true)

    if json_data[:total] == 0
      default_image[:results].first
    else
      json_data[:results].first
    end
  end

  def self.default_image
    response = connection("sky").get.body

    JSON.parse(response, symbolize_names: true)
  end

  private

  def self.connection(location)
    Faraday.new('https://api.unsplash.com/search/photos') do |faraday|
      faraday.params['client_id'] = ENV['UNSPLASH_API_KEY']
      faraday.params['query'] = location
      faraday.params['per_page'] = '1'
      faraday.adapter Faraday.default_adapter
    end
  end
end
