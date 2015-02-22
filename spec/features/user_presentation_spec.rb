require 'rails_helper'

RSpec.feature 'User presentation' do
  include OauthHelper
  include AuthenticationHelper
  include SpecStatusHelper

  scenario 'save user presentation abstract' do
    user_sign_in

    visit presentation_path
    fill_in('Abstract', with: 'ASDF')
    fill_in('Keywords', with: 'a, b, c')

    click_button('Save your presentation abstract')

    expect(page).to have_content 'sucessfully saved'
    expect_ready(page, 'presentation')
  end
end
