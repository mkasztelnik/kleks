require 'rails_helper'

RSpec.describe Education do
  it { should validate_presence_of :education_type }
  it { should validate_inclusion_of(:education_type).in_array(%w(ma ba phd)) }

  it { should validate_presence_of :start_date }
  it { should validate_presence_of :end_date }
  it { should validate_presence_of :university_name }
  it { should validate_presence_of :program_name }
  it { should validate_presence_of :country }
  it { should validate_presence_of :user }

  it 'validates start and end dates interval' do
    education = build(:education,
                      start_date: Time.now,
                      end_date: 1.day.ago)

    expect(education.valid?).to be_falsy
  end
end
