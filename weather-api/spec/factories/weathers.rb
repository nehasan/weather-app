FactoryBot.define do
  factory :weather do
    zip_code { 'L1J 5S2' }
    day { Date.today }
    data { { data: 'Weather Data' } }
  end
end