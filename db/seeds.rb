user = User.find_or_create_by!(email: 'mark_8556@yahoo.co.jp') do |user|
  user.email = 'mark_8556@yahoo.co.jp'
  user.name = 'ゲスト様'
  user.supabase_id = '12f86d95-2778-4cb8-b155-42fe2e02938b'
end

def random_past_date
  current_time = Time.now
  one_year_in_seconds = 365 * 24 * 60 * 60
  random_seconds = rand(one_year_in_seconds)
  random_past_date = current_time - random_seconds
  random_past_date.to_date
end

heart_data = [
  {
    max_heart_rate: 120,
    min_heart_rate: 80,
    avg_heart_rate: 100,
    action_date: random_past_date
  },
  {
    max_heart_rate: 117,
    min_heart_rate: 69,
    avg_heart_rate: 93,
    action_date: random_past_date
  },
  {
    max_heart_rate: 100,
    min_heart_rate: 88,
    avg_heart_rate: 94,
    action_date: random_past_date
  },
  {
    max_heart_rate: 125,
    min_heart_rate: 90,
    avg_heart_rate: 108,
    action_date: random_past_date
  },
  {
    max_heart_rate: 108,
    min_heart_rate: 77,
    avg_heart_rate: 93,
    action_date: random_past_date
  },
  {
    max_heart_rate: 105,
    min_heart_rate: 80,
    avg_heart_rate: 93,
    action_date: random_past_date
  },
  {
    max_heart_rate: 89,
    min_heart_rate: 61,
    avg_heart_rate: 75,
    action_date: random_past_date
  },
  {
    max_heart_rate: 100,
    min_heart_rate: 88,
    avg_heart_rate: 94,
    action_date: random_past_date
  },
  {
    max_heart_rate: 125,
    min_heart_rate: 90,
    avg_heart_rate: 108,
    action_date: random_past_date
  }
]

user.demo_heat_rates.create!(heart_data)

sleep_data = [
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  },
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  },
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  },
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  },
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  },
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  },
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  },
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  },
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  },
  {
    sleep_time: (5..8).to_a.sample,
    sleep_score: rand(3.0..10.0),
    action_date: random_past_date
  }
]
user.demo_sleeps.create!(sleep_data)

anomaly_date = [
  {
    max: (145..180).to_a.sample,
    min: (40..50).to_a.sample,
    anomaly_type: 'heart_rate',
    abnormal_day: random_past_date
  },
  {
    max: (145..180).to_a.sample,
    min: (40..50).to_a.sample,
    anomaly_type: 'heart_rate',
    abnormal_day: random_past_date
  },
  {
    max: (145..180).to_a.sample,
    min: (40..50).to_a.sample,
    anomaly_type: 'heart_rate',
    abnormal_day: random_past_date
  },
  {
    max: (145..180).to_a.sample,
    min: (40..50).to_a.sample,
    anomaly_type: 'heart_rate',
    abnormal_day: random_past_date
  },
  {
    max: (145..180).to_a.sample,
    min: (40..50).to_a.sample,
    anomaly_type: 'heart_rate',
    abnormal_day: random_past_date
  },
  {
    max: (145..180).to_a.sample,
    min: (40..50).to_a.sample,
    anomaly_type: 'heart_rate',
    abnormal_day: random_past_date
  },
  {
    max: (145..180).to_a.sample,
    min: (40..50).to_a.sample,
    anomaly_type: 'heart_rate',
    abnormal_day: random_past_date
  },
  {
    max: (145..180).to_a.sample,
    min: (40..50).to_a.sample,
    anomaly_type: 'heart_rate',
    abnormal_day: random_past_date
  },
  {
    max: (145..180).to_a.sample,
    min: (40..50).to_a.sample,
    anomaly_type: 'heart_rate',
    abnormal_day: random_past_date
  }

]
user.demo_anomalies.create!(anomaly_date)
