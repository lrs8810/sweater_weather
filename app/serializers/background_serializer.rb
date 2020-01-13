class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :results
end
