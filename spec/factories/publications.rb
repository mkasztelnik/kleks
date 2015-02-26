FactoryGirl.define do
  factory :publication do
    title { Faker::Lorem.sentence }
    publication_title { Faker::Lorem.sentence }
    authors { Faker::Lorem.sentence }
    year 2014
    language { Faker::Lorem.word }
    publisher { Faker::Lorem.sentence }

    user
  end
end