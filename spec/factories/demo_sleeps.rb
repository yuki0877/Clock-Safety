FactoryBot.define do
  factory :demo_sleep do
    association :user # Userモデルとの関連付け
  end
end
