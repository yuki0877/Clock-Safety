class Anomaly < ApplicationRecord
  belongs_to :user
  has_one :email

  # anomaly_type が 'heart_rate'、'step'、または nil であることを確認
  validates :anomaly_type, inclusion: { in: ['heart_rate', 'step', nil] }, allow_nil: true
  validates :abnormal_day, presence: { message: '' }
  validates :max, numericality: { only_integer: true, allow_nil: true, message: '' }
  validates :min, numericality: { only_integer: true, allow_nil: true, message: '' }

  # enum 定義
  enum anomaly_type: { heart_rate: 'heart_rate', step: 'step' }
end
