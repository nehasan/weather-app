class Api::V1::WeathersController < ApplicationController
  before_action :authenticate_user

  # [GET] /
  def index
    forecasts = Weather.all
    render json: { data: forecasts }, status: 200
  end

  # [POST] /search
  def search
    permitted = weather_params

    unless permitted[:zip_code].present?
      render json: {
        error: "zip_code value is required"
      }, status: 400
      return
    end

    data = WeatherService::Finder.find_forecast(permitted)

    render json: { data: data }, status: 200
  end

  private

  def weather_params
    params.require(:address).permit(
      :line,
      :city,
      :state,
      :country,
      :zip_code
    )
  end
end
