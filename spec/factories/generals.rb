FactoryGirl.define do
  factory :general do
    accept true
    accept_travel true
    accept_insurance true
    know_from_ces_www true

    user
  end
end
