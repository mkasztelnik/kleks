class StatusMailer < ApplicationMailer
  def reject_email_phd(user)
    @user = user
    mail(to: @user.email, subject: I18n.t('email.reject.subject'))
  end

  def reject_email(user)
    @user = user
    mail(to: @user.email, subject: I18n.t('email.reject.subject'))
  end
end
