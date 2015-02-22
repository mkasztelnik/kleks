FactoryGirl.define do
  factory :language do
    understanding_level 'A1'
    speaking_level 'B1'
    writing_level 'C1'

    user
  end
end
