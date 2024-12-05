module Tasks
  class SendEmail
    def self.send_anomalies
      # 今日異常値があればあればメールを通知
      # if nomaly.exists?(abnormal_day: Date.today.beginning_of_day..Date.today.end_of_day)
      # end
      NotificationMailer.anomalies.deliver_now
   
    end
  end
end
