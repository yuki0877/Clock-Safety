FactoryBot.define do
  factory :anomaly do
    max { 120 }
    min { 40 }
    abnormal_day { Date.current }
    anomaly_type { 'heart_rate' }
    association :user
  end
end
