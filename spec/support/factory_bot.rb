# spec/support/factory_bot.rb
RSpec.configure do |config|
  # FactoryBotを直接使用できるようにする
  config.include FactoryBot::Syntax::Methods
end
