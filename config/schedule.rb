
# Learn more: http://github.com/javan/whenever
# ジョブの crontab ファイルを書き込むには、次のコマンドを実行
# $ whenever --update-crontab
# $ whenever --set environment=$RAILS_ENV --update-crontab
# cron へ反映した内容を削除
# $ bundle exec whenever --clear-crontab
# cronの状態を確認
# $ service cron status
# cron起動
# $ service cron start
# cronの設定状況を確認
# $ bundle exec crontab -e
rails_env = ENV["RAILS_ENV"] || :development
set :environment, rails_env
set :output, "log/cron.log"
set :runner_command, "rails runner"

ENV.each { |k, v| env(k, v) } #追加

every 30.minute do
  runner "Tasks::SendEmail.send_anomalies", environment: rails_env.to_sym
end




