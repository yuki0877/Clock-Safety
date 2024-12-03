require 'rails_helper'

RSpec.describe DemoHeatRate, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = DemoHeatRate.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    it 'is valid with a user' do
      user = create(:user)
      demo_heat_rate = DemoHeatRate.new(user: user)
      expect(demo_heat_rate).to be_valid
    end

    it 'is invalid without a user' do
      demo_heat_rate = DemoHeatRate.new(user: nil)
      expect(demo_heat_rate).not_to be_valid
    end
  end
end
