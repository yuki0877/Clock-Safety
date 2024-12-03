require 'rails_helper'

RSpec.describe DemoAnomaly, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = create(:user)
      demo_anomaly = DemoAnomaly.new(
        user: user,
        anomaly_type: 'heart_rate'
      )
      expect(demo_anomaly).to be_valid
    end

    it 'is invalid without an anomaly_type' do
      user = create(:user)
      demo_anomaly = DemoAnomaly.new(
        user: user,
        anomaly_type: nil
      )
      expect(demo_anomaly).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = DemoAnomaly.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
