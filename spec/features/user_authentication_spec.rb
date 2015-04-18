require 'rails_helper'

RSpec.feature 'User authentication' do
  include OauthHelper
  include AuthenticationHelper

  scenario 'existing user signs in using facebook' do
    user = create(:user, provider: :facebook)
    user.confirm!

    sign_in_as(user)

    expect(page).to have_content user.name
  end

  scenario 'new user signs in using google+' do
    user = build(:user, provider: :google_oauth2)

    sign_in_as(user)

    expect(page).to have_content user.name
  end

  scenario 'user signs in using email, password' do
    user = create(:user, provider: nil)
    user.confirm!

    sign_in_as(user)

    expect(page).to have_content user.name
  end

  scenario 'user signs out' do
    user = build(:user)

    sign_in_as(user)
    find(:linkhref, '/users/sign_out').click

    expect(page).not_to have_content user.name
  end

  scenario 'user email address is empty' do
    user = build(:user, provider: :facebook, email: nil)

    sign_in_as(user)

    expect(page.current_path).to eq new_user_session_path
    expect(page).to have_content 'you don\'t have email set'
  end
end
