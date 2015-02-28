require 'rails_helper'

RSpec.describe Training do
  it { should validate_presence_of :institution }
  it { should validate_presence_of :gained_experience }
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :end_date }
  it { should validate_presence_of :user }

  it { should belong_to :user }

  it 'validates start and end dates interval' do
    training = build(:training,
                      start_date: Time.now,
                      end_date: 1.day.ago)

    expect(training.valid?).to be_falsy
  end
end
