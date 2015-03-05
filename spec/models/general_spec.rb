require 'rails_helper'

RSpec.describe General, type: :model do
  it 'need to be accepted' do
    general = build(:general, accept: true)

    expect(general).to be_valid
  end
end
