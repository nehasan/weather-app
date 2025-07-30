require 'rails_helper'
require 'json'

RSpec.describe "Weathers", type: :request do
  describe "GET /weathers" do
    it "works! (now write some real specs)" do
      get api_v1_weathers_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /search' do
    let!(:saved_weather) {
      create(:weather)
    }

    context 'when address does not have the zip code' do
      it 'returns an error saying zip code required' do
        post search_api_v1_weathers_path, params: {
          address: {
            city: 'xyz_city',
            state: 'xyz_state',
            country: 'xyz_country',
            zip_code: ''
          }
        }

        expect(response).to have_http_status(400)
        body = JSON.parse(response.body)
        # puts "--- response: #{body}"
        expect(body["error"]).to eq('zip_code value is required')
      end
    end

    context 'when the search params has the zip code' do
      it 'returns forecast based on given address' do
        post search_api_v1_weathers_path, params: {
          address: {
            city: 'xyz_city',
            state: 'xyz_state',
            country: 'xyz_country',
            zip_code: 'xyz'
          }
        }

        expect(response).to have_http_status(200)
      end
    end
  end
end
