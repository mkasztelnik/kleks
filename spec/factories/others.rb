FactoryGirl.define do
  factory :other do
    title { Faker::Lorem.sentence }

    user
  end
end
