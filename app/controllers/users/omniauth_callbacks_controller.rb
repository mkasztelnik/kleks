module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def self.provides_callback_for(provider)
      class_eval %Q{
        def #{provider}
          auth = env["omniauth.auth"]
          if auth.info.email.blank?
            flash[:alert] = I18n.t('omniauth.email_missing',
                                   provider: "#{provider}".capitalize)
            redirect_to new_user_session_path
          else
            @user = User.from_omniauth(auth)

            if @user.persisted?
              sign_in_and_redirect @user, event: :authentication
              set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
            else
              session["devise.#{provider}_data"] = env["omniauth.auth"]
              redirect_to root_url
            end
          end
        end
      }
    end

    [:facebook, :google_oauth2].each do |provider|
      provides_callback_for provider
    end

    def after_omniauth_failure_path_for(scope)
      root_path
    end
  end
end
