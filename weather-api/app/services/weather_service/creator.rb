module WeatherService
  class Creator < ApplicationService
    def self.create_forecast(params)
      # Fetch the forecast from weather Api
      forecast = WeatherService::Api.fetch_forecast(params)

      # Check and parse the response
      if forecast[:code] == "200"
        data = forecast[:data]
        created_data = WeatherConcern.create({
          zip_code: params[:zip_code],
          day: Date.today,
          data: data
        })

        # Write to cache for the next 30 mins availablity
        WeatherConcern.write_cache(created_data)
        created_data
      else
        {}
      end
    end
  end
end
