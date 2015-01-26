module AuthenticationHelper
  def sign_in_as(user)
    user.provider.blank? ? sign_in(user) : omniauth_sign_in(user)
  end

  private

  def omniauth_sign_in(user)
    stub_oauth(
      user.provider.to_sym,
      name: user.name,
      email: user.email
    )
    visit root_path
    find(:linkhref, user_omniauth_authorize_path(user.provider)).click
  end

  def sign_in(user)
    visit root_path

    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)

    click_button 'Log in'
  end
end
