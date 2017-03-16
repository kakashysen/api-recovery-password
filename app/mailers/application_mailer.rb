class ApplicationMailer < ActionMailer::Base
  default from: 'sender@gmail.com'
  layout 'mailer'
end
