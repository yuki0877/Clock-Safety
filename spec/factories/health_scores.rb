# spec/factories/health_scores.rb
FactoryBot.define do
  factory :health_score do
    heart_rate { 70 }
    sleep_duration { 8 }
    step_count { 10_000 }
    association :user # `user` ファクトリを関連付ける
  end
end
