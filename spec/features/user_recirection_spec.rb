require 'rails_helper'

RSpec.feature 'User redirection' do
  include OauthHelper
  include AuthenticationHelper

  scenario 'normal user is redirected into application form' do
    user_sign_in

    visit root_path

    expect(page.current_path).to eq general_path
  end

  scenario 'reviewer is redirected into users list' do
    sign_in_as(create(:user, reviewer: true).tap { |u| u.confirm! })

    visit root_path

    expect(page.current_path).to eq reviews_path
  end
end