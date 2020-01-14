require 'rails_helper'

describe 'User Login API' do
  it 'can login a registered user' do
    User.create(email: 'whatever@example.com',
                password: 'password',
                password_confirmation: 'password')

    user_params = {
      email: 'whatever@example.com',
      password: 'password',
    }

    post "/api/v1/sessions", params: user_params.to_json

    request_params = request.params[:session].symbolize_keys

    expect(request_params).to eq(user_params)

    last_response = response

    expect(last_response.status).to eq(200)

    response_body = JSON.parse(last_response.body, symbolize_names: true)

    expect(response_body[:data][:attributes]).to have_key(:api_key)
  end

  it 'cannot create a new user if all fields are not present' do
    User.create(email: 'whatever@example.com',
                password: 'password',
                password_confirmation: 'password')

    user_params = {
      email: 'whatever@example.com',
      password_confirmation: 'secure'
    }

    post "/api/v1/sessions", params: user_params.to_json

    last_response = response

    expect(last_response.status).to eq(400)
  end
end
