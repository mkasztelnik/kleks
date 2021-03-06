FactoryGirl.define do
  factory :training do
    title { Faker::Company.catch_phrase }
    institution { Faker::Company.name }
    country { Faker::Address.country }
    start_date { 1.day.ago }
    end_date { Time.now }

    user
  end
end
