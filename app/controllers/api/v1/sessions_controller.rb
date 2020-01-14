class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: user_error_message, status: 400
    end
  end

  private
  def user_error_message
    'The email and password you entered did not match our records. Please double-check and try again.'
  end
end
