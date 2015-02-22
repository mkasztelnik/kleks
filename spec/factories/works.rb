FactoryGirl.define do
  factory :work do
    institution { Faker::Company.name }
    responsibility { Faker::Company.catch_phrase }
    start_date { 1.day.ago }
    end_date { Time.now }
    country { Faker::Address.country }

    user
  end
end
