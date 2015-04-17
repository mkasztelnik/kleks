class UserMailer < ApplicationMailer
  def submit_email(user)
    @user = user
    mail(to: @user.email, subject: I18n.t('email.submit.subject'))
  end
end
