class Weather < ApplicationRecord
  validates :zip_code, presence: true
  validates :day, presence: true
  validates :data, presence: true
end
