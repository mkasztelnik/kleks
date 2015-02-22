require 'rails_helper'

RSpec.feature 'User motivation' do
  include OauthHelper
  include AuthenticationHelper
  include SpecStatusHelper

  scenario 'save user motivation' do
    user_sign_in

    visit motivation_path
    fill_in('Your motivation', with: 'ASDF')

    click_button('Save your motivation')

    expect(page).to have_content 'sucessfully saved'
    expect_ready(page, 'motivation')
  end
end
