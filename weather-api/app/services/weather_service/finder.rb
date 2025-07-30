module WeatherService
  class Finder < ApplicationService
    # Search for the forecast based on address
    def self.find_forecast(params)
      forecast = nil
      forecast = fetch_cache(params)
      forecast = fetch_db(params) unless forecast.present?

      unless forecast
        # Create a new forecast if not found in db / cache
        forecast = WeatherService::Creator.create_forecast(params)
      end

      forecast
    end

    private

    # Fetches the forecast from db
    def self.fetch_db(params)
      forecast = Weather.find_by_zip_code(params[:zip_code])
      return unless forecast

      # Now add it to the cache store for next half n hour availability
      WeatherConcern.write_cache(forecast)
      puts "pulled from db"
      forecast
    end

    # Fetches the forecast from cache
    def self.fetch_cache(params)
      forecast = WeatherConcern.read_cache(params[:zip_code])
      return unless forecast

      puts "pulled from cache"
      forecast
    end
  end
end
