FactoryGirl.define do
  factory :training do
    institution { Faker::Company.name }
    gained_experience { Faker::Company.catch_phrase }
    country { Faker::Address.country }
    start_date { 1.day.ago }
    end_date { Time.now }

    user
  end
end
