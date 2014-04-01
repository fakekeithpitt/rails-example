# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
RailsExample::Application.initialize!

puts "Using Database: #{ENV['DATABASE_ADAPTER'] || 'postgres'}"
