FactoryGirl.define do
  factory :presentation do
    abstract { Faker::Lorem.words(4) }
    keywords { Faker::Lorem.words(4) }

    user
  end
end