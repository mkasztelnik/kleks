require 'rails_helper'

RSpec.describe Work do
  it { should validate_presence_of :institution }
  it { should validate_presence_of :responsibility }
  it { should validate_presence_of :country }
  it { should validate_presence_of :start_date }
  it { should validate_presence_of :user }

  it 'validates start and end dates interval' do
    work = build(:work,
                 start_date: Time.now,
                 end_date: 1.day.ago)

    expect(work).to_not be_valid
  end

  it 'dont need end date' do
    work = build(:work, end_date: nil)

    expect(work).to be_valid
  end
end
