require 'rails_helper'

describe 'User Registration API' do
  it 'can create a new user with an unique api key' do
    user_params = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post "/api/v1/users", params: {user: user_params}.to_json

    request_params = request.params['user'].symbolize_keys

    expect(request_params).to eq(user_params)

    last_response = response
    
    expect(last_response.status).to eq(201)

    response_body = JSON.parse(last_response.body, symbolize_names: true)

    expect(response_body[:data][:attributes]).to have_key(:api_key)
  end

  it 'cannot create a new user if all fields are not present' do
    user_params = {
      password: 'password',
      password_confirmation: 'password'
    }

    post "/api/v1/users", params: {user: user_params}.to_json

    last_response = response

    expect(last_response.status).to eq(400)
  end

  it 'cannot create a new user without a password confirmation' do
    user_params = {
      email: 'whatever@example.com',
      password: 'password'
    }

    post "/api/v1/users", params: {user: user_params}.to_json

    last_response = response

    expect(last_response.status).to eq(400)
  end

  it 'cannot create a new user if password and password_confirmation do not match' do
    user_params = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'secure'
    }

    post "/api/v1/users", params: {user: user_params}.to_json

    last_response = response

    expect(last_response.status).to eq(400)
  end

  it 'cannot create a new user if email is taken' do
    User.create(email: 'whatever@example.com',
                password: '1234',
                password_confirmation: '1234')

    user_params = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post "/api/v1/users", params: {user: user_params}.to_json

    last_response = response

    expect(last_response.status).to eq(400)
  end
end
