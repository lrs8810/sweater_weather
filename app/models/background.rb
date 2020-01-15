class Background
  attr_reader :id,
              :url,
              :description,
              :photographer

  def initialize(json_data)
    @id = 1.to_s
    @url = json_data[:urls][:full]
    @description = json_data[:description]
    @photographer = json_data[:user][:name]
  end
end
