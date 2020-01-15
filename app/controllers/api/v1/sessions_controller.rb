class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: email_params)
    if user&.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: user_error_message, status: 400
    end
  end

  private
  def email_params
    params.permit(:email)
  end

  def user_error_message
    {
      error: 'The email and password you entered did not match our records. Please double-check and try again.'
    }
  end
end
