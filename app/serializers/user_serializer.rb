class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :api_key
end
