class User < ApplicationRecord
  has_many :emails
  has_many :anomalies
  has_many :demo_anomalies
  has_many :demo_heat_rates
  has_many :demo_sleeps

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is invalid' }

  def calculate_expires_in(expires_in)
    return if expires_in.nil?

    now_jst = Time.now + (9 * 3600)
    now_jst + expires_in
  end
end
