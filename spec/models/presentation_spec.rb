require 'rails_helper'

RSpec.describe Presentation do
  it { should validate_presence_of :title }
  it { should validate_presence_of :abstract }
  it do
    should validate_length_of(:abstract).
            is_at_most(1500).
            with_message(I18n.t('presentation.abstract_to_long', count: 1500))
  end

  it { should validate_presence_of :keywords }
  it 'allows max 4 keywords' do
    presentation = build(:presentation, keywords: 'a, b c, d, efg, h')

    expect(presentation.valid?).to be_falsy
    expect(presentation.errors['keywords'].first).
      to eq I18n.t('presentation.keywords_to_long', count: 4)
  end


  it { should validate_presence_of :user }
end
