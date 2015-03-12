require 'rails_helper'

RSpec.describe Profile do
  subject { build(:profile) }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :date_of_birth }
  it { should validate_presence_of :place_of_birth }
  it { should validate_presence_of :citizenship }
  it { should validate_presence_of :country }
  it { should validate_presence_of :address }

  context 'when need visa' do
    subject { build(:profile, need_visa: true) }

    it { should validate_presence_of :passport_number }
  end

  it 'has first and last names delegated from the user' do
    user = build(:user)
    profile = build(:profile, user: user)

    expect(profile.first_name).to eq user.first_name
    expect(profile.last_name).to eq user.last_name
  end

  it 'updates user first name and last name as save' do
    user = create(:user)
    profile = build(:profile, user: user)

    profile.first_name = 'new_first_name'
    profile.last_name = 'new_last_name'

    profile.save
    user.reload

    expect(user.first_name).to eq 'new_first_name'
    expect(user.last_name).to eq 'new_last_name'
  end
end
