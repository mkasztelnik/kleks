require 'rails_helper'

RSpec.describe Language do
  it do
    should validate_inclusion_of(:understanding_level).
            in_array(Language::LEVELS)
    should validate_inclusion_of(:speaking_level).
            in_array(Language::LEVELS)
    should validate_inclusion_of(:writing_level).
            in_array(Language::LEVELS)
  end

  it { should validate_presence_of :understanding_level }
  it { should validate_presence_of :speaking_level }
  it { should validate_presence_of :writing_level }

  it { should_not validate_presence_of :study_program }
  it { should_not validate_presence_of :study_url }
  it { should_not validate_presence_of :certificate_name }
  it { should_not validate_presence_of :certificate_year }
  it { should_not validate_presence_of :certificate_score }
  it { should_not validate_presence_of :other_description }


  context 'native' do
    subject do
      build(:language, native: true, study: true,
            certificate: true, other: true)
    end

    it do
      should_not validate_presence_of :understanding_level
      should_not validate_presence_of :speaking_level
      should_not validate_presence_of :writing_level
      should_not validate_presence_of :study_program
      should_not validate_presence_of :study_url
      should_not validate_presence_of :certificate_name
      should_not validate_presence_of :certificate_year
      should_not validate_presence_of :certificate_score
      should_not validate_presence_of :other_description
    end
  end

  context 'english study' do
    subject { build(:language, study: true, native: false) }

    it { should validate_presence_of :study_program }
    it { should validate_presence_of :study_url }
  end

  context 'certificate' do
    subject { build(:language, certificate: true, native: false) }

    it { should validate_presence_of :certificate_name }
    it { should validate_presence_of :certificate_year }
    it { should validate_presence_of :certificate_score }
  end

  context 'other' do
    subject { build(:language, other: true, native: false) }

    it { should validate_presence_of :other_description }
  end

  it 'at least one language expertise is needed' do
    language = build(:language,
                     native: false,
                     study: false,
                     certificate: false,
                     other: false)

    expect(language.valid?).to be_falsy
  end
end
