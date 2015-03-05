module Users
  class RegistrationsController < Devise::RegistrationsController

    def new
      autorize_open! && super
    end

    def create
      autorize_open! && super
    end

    def after_sign_up_path_for(_resource)
      new_user_session_path
    end

    def after_inactive_sign_up_path_for(_resource)
      new_user_session_path
    end

    private

    def autorize_open!
      unless Kleks.open?
        redirect_to(new_user_session_path,
                    alert: I18n.t('devise.registrations.closed'))
        false
      else
        true
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