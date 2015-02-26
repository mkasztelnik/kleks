require 'rails_helper'

RSpec.describe Conference do
  it { should validate_presence_of :title }
  it { should validate_presence_of :address }
  it { should validate_presence_of :conference_name }
  it { should validate_presence_of :presentation_type }
  it do
    should validate_inclusion_of(:presentation_type).
      in_array(%w(oral poster))
  end
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :end_date }

  it 'validates start and end dates interval' do
    education = build(:conference,
                      start_date: Time.now,
                      end_date: 1.day.ago)

    expect(education.valid?).to be_falsy
  end
end
