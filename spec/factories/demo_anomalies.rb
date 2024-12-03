FactoryBot.define do
  factory :demo_anomaly do
    association :user # Userモデルとの関連付け
    anomaly_type { DemoAnomaly.anomaly_types.keys.sample } # heart_rate または step をランダムに選択
  end
end
