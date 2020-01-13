class DarkSkyService
  def self.get_forecast(lat, lng)
    response = connection(lat, lng).get.body

    JSON.parse(response, symbolize_names: true)
  end

  private

    def self.connection(lat, lng)
      Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{lat},#{lng}") do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

end
