module AuthenticationHelper
  def sign_in_as(user)
    user.provider.blank? ? sign_in(user) : omniauth_sign_in(user)
  end

  private

  def omniauth_sign_in(user)
    stub_oauth(
      user.provider.to_sym,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email
    )
    visit root_path
    find(:linkhref, user_omniauth_authorize_path(user.provider)).click
  end

  def sign_in(user)
    visit root_path

    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)

    click_button 'Sign in'
  end
end
