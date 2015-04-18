class ApplicationMailer < ActionMailer::Base
  default from: ENV['EMAIL_USERNAME'] || 'resproject@uj.edu.pl'
  layout 'mailer'
end
