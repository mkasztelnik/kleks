require 'rails_helper'

RSpec.describe Other do
  it { should validate_presence_of :title }
end
