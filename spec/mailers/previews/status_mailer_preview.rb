# Preview all emails at http://localhost:3000/rails/mailers/status_mailer
class StatusMailerPreview < ActionMailer::Preview
  def reject_phd
    StatusMailer.reject_email_phd(User.first)
  end

  def reject_ma_ba
    StatusMailer.reject_email(User.first)
  end
end
