FactoryGirl.define do
  factory :conference do
    title { Faker::Lorem.sentence }
    country { Faker::Address.country }
    conference_name { Faker::Lorem.sentence }
    presentation_type :oral
    year { Time.now.year }

    user
  end
end
