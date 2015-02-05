module OauthHelper
  def stub_oauth(provider, options = {})
    OmniAuth.config.add_mock(
      provider,
      info: options,
      provider: provider,
      uid: '123'
    )
  end
end
