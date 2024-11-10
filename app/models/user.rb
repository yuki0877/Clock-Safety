class User < ApplicationRecord
  has_many :mails
  has_many :anomalies
  has_many :demo_anomalies
  has_many :demo_heat_rates
  has_many :demo_sleeps
  
  validates :name, presence: true
  validates :email, uniqueness: true

  def calculate_expires_in(expires_in)
    return if expires_in.nil?
    now_jst = Time.now + (9 * 3600)  
    expires_in = now_jst + expires_in
    expires_in
  end
end
