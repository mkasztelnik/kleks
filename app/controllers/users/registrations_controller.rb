module Users
  class RegistrationsController < Devise::RegistrationsController

    def after_sign_up_path_for(_resource)
      new_user_session_path
    end

    def after_inactive_sign_up_path_for(_resource)
      new_user_session_path
    end

    private

    def signup_enabled?
      unless current_application_settings.signup_enabled?
        redirect_to(new_user_session_path)
      end
    end

    def sign_up_params
      params.require(:user).
        permit(:email,
               :last_name,
               :first_name,
               :password,
               :password_confirmation)
    end
  end
end