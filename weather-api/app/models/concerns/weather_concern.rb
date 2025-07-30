class WeatherConcern < ApplicationRecord
  class << self
    def get(id)
      Weather.find(id)
    end

    def create(weather)
      Weather.create!(weather)
    end

    def write_cache(weather)
      puts "Writing to cache ..."
      Rails.cache.write(
        "zip-code-#{weather[:zip_code]}",
        weather,
        expires_in: 30.minutes
      )
    end

    def read_cache(key)
      puts "Reading cache ..."
      data = Rails.cache.read(
        "zip-code-#{key}"
      )
      data
    end
  end
end
