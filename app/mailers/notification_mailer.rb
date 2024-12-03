class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.anomalies.subject
  #
  def anomalies
    email = "akemi.sample.1203@gmail.com"
    mail(to: email, subject: 'hello world')
  end
end