FactoryGirl.define do
  factory :motivation do
    text { Faker::Lorem.sentence }

    user
  end
end
