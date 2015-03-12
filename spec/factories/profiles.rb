FactoryGirl.define do
  factory :profile do
    date_of_birth { 19.years.ago }
    place_of_birth { Faker::Address.city }
    citizenship { Faker::Address.country }
    passport_number { Faker::Lorem.characters(10) }
    country { Faker::Address.country }

    user
    address
  end
end