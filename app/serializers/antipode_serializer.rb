class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :location_name, :forecast, :search_location
end
