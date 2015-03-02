require 'rails_helper'

RSpec.describe Address do
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :country }
  it { should validate_presence_of :postcode }
end
