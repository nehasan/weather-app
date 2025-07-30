require 'rails_helper'

RSpec.describe Weather, type: :model do
  describe 'validations' do
    it 'is valid with a the required fields' do
      weather = build(:weather)
      expect(weather).to be_valid
    end

    it 'is invalid without a zip_code' do
      weather = build(:weather, zip_code: nil)
      expect(weather).not_to be_valid
      expect(weather.errors[:zip_code]).to include("can't be blank")
    end

    it 'is invalid without a day' do
      weather = build(:weather, day: nil)
      expect(weather).not_to be_valid
      expect(weather.errors[:day]).to include("can't be blank")
    end

    it 'is invalid without the weather data' do
      weather = build(:weather, data: nil)
      expect(weather).not_to be_valid
      expect(weather.errors[:data]).to include("can't be blank")
    end
  end
end
