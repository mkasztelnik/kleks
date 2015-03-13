require 'rails_helper'

RSpec.describe General, type: :model do
  it 'need to be accepted' do
    general = build(:general,
                    accept: true,
                    accept_travel: true,
                    accept_insurance: true)

    expect(general).to be_valid
  end

  it 'need at last one know from selected' do
    general = build(:general, know_from_ces_www: false)

    expect(general).to_not be_valid
  end
end
