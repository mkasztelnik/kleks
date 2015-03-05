module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :authorize_open!

    def after_sign_up_path_for(_resource)
      new_user_session_path
    end

    def after_inactive_sign_up_path_for(_resource)
      new_user_session_path
    end

    private

    def authorize_open!
      raise RegistrationClosed unless Kleks.open?
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