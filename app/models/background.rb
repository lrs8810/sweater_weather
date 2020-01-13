class Background
  attr_reader :id, :results

  def initialize(service_json_data)
    @id = '1'
    @results = service_json_data
  end
end
