require 'rails_helper'

RSpec.describe Language do
  it { should validate_presence_of :understanding_level }
  it do
    should validate_inclusion_of(:understanding_level).
            in_array(Language::LEVELS)
  end

  it { should validate_presence_of :speaking_level }
  it do
    should validate_inclusion_of(:speaking_level).
            in_array(Language::LEVELS)
  end

  it { should validate_presence_of :writing_level }
  it do
    should validate_inclusion_of(:writing_level).
            in_array(Language::LEVELS)
  end

  it { should_not validate_presence_of :study_program }
  it { should_not validate_presence_of :study_url }
  it { should_not validate_presence_of :certificate_name }
  it { should_not validate_presence_of :certificate_year }
  it { should_not validate_presence_of :certificate_score }
  it { should_not validate_presence_of :other_description }


  context 'english study' do
    subject { build(:language, study: true) }

    it { should validate_presence_of :study_program }
    it { should validate_presence_of :study_url }
  end

  context 'certificate' do
    subject { build(:language, certificate: true) }

    it { should validate_presence_of :certificate_name }
    it { should validate_presence_of :certificate_year }
    it { should validate_presence_of :certificate_score }
  end

  context 'other' do
    subject { build(:language, other: true) }

    it { should validate_presence_of :other_description }
  end
end
