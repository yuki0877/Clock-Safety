class NotificationMailer < ApplicationMailer

  def anomalies
    # TODO receiver_emailに変更
    email = Rails.application.credentials.dig(:gmail, :test_receiver_email)
    mail(to: email, subject: 'お知らせ')
  end
end