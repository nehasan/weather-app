class Weather < ApplicationRecord
  validates :zip_code, presence: true
end
