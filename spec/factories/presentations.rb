FactoryGirl.define do
  factory :presentation do
    title { Faker::Lorem.words(4) }
    abstract { Faker::Lorem.words(4) }
    keywords { Faker::Lorem.words(4) }

    user
  end
end