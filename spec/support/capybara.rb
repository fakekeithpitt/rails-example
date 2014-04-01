require 'capybara/rails'
require 'capybara/poltergeist'

capybara_driver = ENV['CAPYBARA_DRIVER'] || :rack_test
puts "Using Capybara Driver: #{capybara_driver}"

Capybara.default_driver = capybara_driver.to_sym
