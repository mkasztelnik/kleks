FactoryGirl.define do
  factory :conference do
    title { Faker::Lorem.sentence }
    address { Faker::Address.street_address }
    conference_name { Faker::Lorem.sentence }
    presentation_type :oral
    start_date { 1.day.ago }
    end_date { Time.now }

    user
  end
end
