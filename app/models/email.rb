class Email < ApplicationRecord
    belongs_to :user
    belongs_to :anomaly

    validates :user_id, presence: true
    validates :anomaly_id, presence: true
    validates :message, presence: true, length: { maximum: 255 }
    validates :sent_at, presence: true

  end