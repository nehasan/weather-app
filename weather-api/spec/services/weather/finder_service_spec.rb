require 'rails_helper'

RSpec.describe WeatherService::Finder, type: :service do
  # let!(:cached_forecast) { 
  #   Rails.cache.write('zip-code-test_zip_code', { data: 'test_wather_data' }) 
  # }
  # let(:forecast) { WeatherService::Finder.find_forecast({ zip_code: 'test_zip_code' }) }

  describe 'find forecast' do
    context 'when data is cached already' do
      before do
        Rails.cache.clear
        Rails.cache.write('zip-code-xyz', { data: 'test_wather_data' })
      end
      subject { WeatherService::Finder.find_forecast({ zip_code: 'xyz' }) }
      it 'always looks forecast data into cache first' do
        # puts "#{Rails.cache.read('zip-code-xyz')}"
        # puts "--- forecast #{subject}"
        expect(subject).not_to be(nil)
      end
    end

    context 'when data is not cached but stored in db' do
      let(:saved_weather) { create(:weather, zip_code: 'xyz') }

      before do
        Rails.cache.clear
      end
      subject { WeatherService::Finder.find_forecast({ zip_code: 'xyz' }) }
      it 'looks forecast data into db after cache lookup' do
        puts "--- forecast #{subject}"
        puts "--- stored weather #{saved_weather.inspect}"
      end
    end
  end
end