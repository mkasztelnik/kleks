FactoryGirl.define do
  factory :address do
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    country { Faker::Address.country }
    state { Faker::Address.state }
    postcode { Faker::Address.zip_code }
  end
end
