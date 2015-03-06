require 'rails_helper'

RSpec.feature 'User redirection' do
  include OauthHelper
  include AuthenticationHelper

  scenario 'normal user is redirected into application form' do
    user_sign_in

    visit root_path

    expect(page.current_path).to eq general_path
  end
end