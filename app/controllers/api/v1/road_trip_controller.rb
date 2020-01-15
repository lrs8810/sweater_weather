class Api::V1::RoadTripController < ApplicationController
  before_action :authenticate

  def create
    road_trip_facade = RoadTripFacade.new(road_trip_params)
    render json: RoadTripSerializer.new(road_trip_facade)
  end

  private

  def authenticate
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: error, status: 401
    end
  end

  def road_trip_params
    params.permit(:origin, :destination)
  end

  def error
    { error: 'Access denied'}
  end
end
