FactoryBot.define do
  factory :user do
    name { 'Test User' }
    email { Faker::Internet.unique.email } # Fakerでユニークなメールアドレスを生成
    supabase_id { SecureRandom.uuid }
    access_token { SecureRandom.hex(16) }  # 16バイトのランダムなトークンを生成
  end
end
