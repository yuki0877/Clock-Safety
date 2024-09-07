class Anomaly < ApplicationRecord
    belongs_to :user
    has_one :mails
    validates :anomaly_type, presence: true

    enum anomaly_type: { heart_rate: "heart_rate", step: "step" }
  end
