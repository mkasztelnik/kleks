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
    fill_in('Date of birth', with: '1995-02-03')
    fill_in('Place of birth', with: 'Lodygowice')
    select('Poland', from: 'profile_country')
    fill_in('Citizenship', with: 'Polish')

    select('Male', from: 'Sex')
    fill_in('Passport number', with: '123')

    fill_in('profile_address_attributes_address', with: '123 str')
    fill_in('City', with: 'Cracow')
    select('Poland', from: 'profile_address_attributes_country')
    fill_in('State', with: 'Malopolskie')
    fill_in('Postcode', with: '12-345')

    click_button(I18n.t('profile.save'))

    expect(page).to have_content 'sucessfully saved'
    expect_ready(page, 'profile')
  end
end
