require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :deletion
  end

  config.after(:each) do |example|
    DatabaseCleaner.clean
  end
end
