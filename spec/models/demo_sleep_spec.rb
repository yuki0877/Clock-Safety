require 'rails_helper'

RSpec.describe DemoSleep, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = DemoSleep.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    it 'is valid with a user' do
      user = create(:user)
      demo_sleep = DemoSleep.new(user: user)
      expect(demo_sleep).to be_valid
    end

    it 'is invalid without a user' do
      demo_sleep = DemoSleep.new(user: nil)
      expect(demo_sleep).not_to be_valid
      expect(demo_sleep).not_to be_valid
    end
  end
end
