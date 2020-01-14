class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: user.errors.full_messages.uniq.to_sentence, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
