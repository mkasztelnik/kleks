require 'rails_helper'

RSpec.describe Motivation do
  it { should validate_presence_of :text }
  it do
    should validate_length_of(:text).
            is_at_most(2500).
            with_message(I18n.t('motivation.to_long', count: 2500))
  end

  it { should validate_presence_of :user }
end
