module WeatherService
  class Api < ApplicationService
    require "net/http"
    require "uri"
    require "json"

    API_KEY = ENV.fetch("API_KEY")
    BASE_URL = ENV.fetch("BASE_URL")

    # Fetches the current weather data from weather Api
    # http://api.weatherapi.com/current.json
    def self.fetch_current(params)
      data = {}
      uri = URI("#{BASE_URL}/current.json")
      # Need to write rest of the code to fetch current
    end

    # Fetches the forecast data from weather Api
    # http://api.weatherapi.com/forecast.json
    def self.fetch_forecast(params)
      # Build the full URI with query parameters
      data = {}
      uri = URI("#{BASE_URL}/forecast.json")
      uri.query = URI.encode_www_form({
        key: API_KEY,
        q: params[:zip_code],
        days: 1,
        aqi: "no",
        alerts: "no"
      })

      # Make the GET request
      response = Net::HTTP.get_response(uri)

      # Check and parse the response
      if response.is_a?(Net::HTTPSuccess)
        data = {
          code: response.code,
          data: JSON.parse(response.body),
          message: "success"
        }
      else
        data = {
          code: response.code,
          data: {},
          message: response.message
        }
      end

      data
    end
  end
end
