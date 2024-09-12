class DemoAnomaly < ApplicationRecord
    belongs_to :user
    validates :anomaly_type, presence: true

    enum anomaly_type: { heart_rate: "heart_rate", step: "step" }
end
