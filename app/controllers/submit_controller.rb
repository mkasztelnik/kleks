class SubmitController < ApplicationController

  def submit
    if current_user.application_ready? &&
      current_user.update_attributes(submitted: true)

      redirect_to root_path, notice: I18n.t('application.submitted')
    else
      redirect_to root_path, alert: I18n.t('application.not_ready')
    end
  end
end