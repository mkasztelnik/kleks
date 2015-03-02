FactoryGirl.define do
  factory :user, aliases: [:author] do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    provider :facebook
    gender 'Male'

    password { SecureRandom.hex(8) }
    password_confirmation { password }
  end
end
