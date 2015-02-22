FactoryGirl.define do
  factory :education do
    education_type :ma
    start_date { 1.day.ago }
    end_date { Time.now }
    university_name { Faker::Company.name }
    program_name { Faker::Company.catch_phrase }
    country { Faker::Address.country }

    user
  end
end
