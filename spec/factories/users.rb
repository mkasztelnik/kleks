FactoryGirl.define do
  factory :user, aliases: [:author] do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    provider :facebook

    password { SecureRandom.hex(8) }
    password_confirmation { password }
  end
end
