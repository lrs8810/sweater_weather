class ForecastFormatter
  attr_reader :current_temp,
              :summary
              
  def initialize(json_data)
    @current_temp = json_data[:currently][:temperature]
    @summary = json_data[:currently][:summary]
  end
end
