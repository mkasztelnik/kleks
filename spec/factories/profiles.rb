FactoryGirl.define do
  factory :profile do
    date_of_birth { Faker::Date.backward(14) }
    place_of_birth { Faker::Address.city }
    citizenship { Faker::Address.country }
    passport_number { Faker::Lorem.characters(10) }
    passport_date_of_issue { Faker::Date.backward(14) }
    passport_place_of_issue { Faker::Address.city }
    passport_issuing_agency { Faker::Company.name }
    country { Faker::Address.country }

    user
    address
  end
end