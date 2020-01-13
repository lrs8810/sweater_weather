class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :results
end
