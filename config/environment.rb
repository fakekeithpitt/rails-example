# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
RailsExample::Application.initialize!

# Say which DB we're using
puts "Using database: #{ENV['DATABASE_ADAPTER'] || 'postgres'}"
