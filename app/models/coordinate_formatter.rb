class CoordinateFormatter
  attr_reader :lat,
              :long

  def initialize(json_data)
    @lat = json_data[:results][0][:geometry][:location][:lat]
    @long = json_data[:results][0][:geometry][:location][:lng]
  end
end
