require 'rails_helper'

RSpec.describe Publication do
  it { should validate_presence_of :publication_title }
  it { should validate_presence_of :authors }
  it { should validate_presence_of :year }
  it { should validate_presence_of :user }

  it { should belong_to :user }
end
