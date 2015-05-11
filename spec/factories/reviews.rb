FactoryGirl.define do
  factory :review do
    user
    reviewer { build(:user) }
  end
end
