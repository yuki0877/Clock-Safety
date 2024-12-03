require 'rails_helper'

RSpec.describe Anomaly, type: :model do
  let(:user) { create(:user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      anomaly = build(:anomaly, user: user, max: 120, min: 60, abnormal_day: Date.current, anomaly_type: :heart_rate)
      expect(anomaly).to be_valid
    end

    it 'is valid without anomaly_type (nil)' do
      anomaly = build(:anomaly, user: user, anomaly_type: nil)
      expect(anomaly).to be_valid
    end

    it 'is invalid without abnormal_day' do
      anomaly = build(:anomaly, user: user, abnormal_day: nil)
      expect(anomaly).not_to be_valid
    end

    it 'is invalid if max is not an integer' do
      anomaly = build(:anomaly, user: user, max: 'high')
      expect(anomaly).not_to be_valid
    end

    it 'is invalid if min is not an integer' do
      anomaly = build(:anomaly, user: user, min: 'low')
      expect(anomaly).not_to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'enums' do
    it 'defines anomaly_type enum correctly' do
      expect(Anomaly.anomaly_types.keys).to include('heart_rate', 'step')
    end
  end
end
