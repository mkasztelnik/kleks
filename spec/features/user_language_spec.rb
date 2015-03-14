require 'rails_helper'

RSpec.feature 'User language' do
  include OauthHelper
  include AuthenticationHelper
  include SpecStatusHelper

  scenario 'save information about user language' do
    user_sign_in

    visit language_path
    select('A1', from: 'Understanding')
    select('B1', from: 'Speaking')
    select('C1', from: 'Writing')
    check('Native')

    click_button(I18n.t('language.save'))

    expect(page).to have_content 'sucessfully saved'
    expect_ready(page, 'language')
  end
end
