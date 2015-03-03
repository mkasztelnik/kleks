require 'rails_helper'

RSpec.describe Conference do
  it { should validate_presence_of :title }
  it { should validate_presence_of :country }
  it { should validate_presence_of :conference_name }
  it { should validate_presence_of :presentation_type }
  it do
    should validate_inclusion_of(:presentation_type).
      in_array(%w(oral poster))
  end
  it { should validate_presence_of :year }
end
