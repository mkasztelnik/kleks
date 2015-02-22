require 'rails_helper'

RSpec.feature 'User profile' do
  include OauthHelper
  include AuthenticationHelper
  include SpecStatusHelper

  scenario 'save user profile' do
    user_sign_in

    visit profile_path

    fill_in('First name', with: 'John')
    fill_in('Last name', with: 'Doe')
    fill_in('Date of birth', with: '2013-02-03')
    fill_in('Place of birth', with: 'Lodygowice')
    fill_in('Citizenship', with: 'Polish')
    select('Poland', from: 'Country')
    fill_in('Number', with: '123')
    fill_in('Date of issue', with: '2014-03-12')
    fill_in('Place of issue', with: 'Krakow')
    fill_in('Issuing agency', with: 'ABC')

    click_button('Save personal data')

    expect(page).to have_content 'sucessfully saved'
    expect_ready(page, 'profile')
  end
end
