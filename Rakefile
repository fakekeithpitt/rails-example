# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

desc "Runs the test suite againsts each different environment"
task :all_specs do
  require 'tempfile'

  script = "#!/bin/bash"

  { "DATABASE_ADAPTER" => %w(mysql postgres) }.each do |key, values|
    values.each do |value|
      script << "\n#{key}=#{value} ./bin/rspec"
    end
  end

  tempfile = Tempfile.new('tests.sh')
  tempfile.write(script)
  tempfile.close

  File.chmod(0777, tempfile.path)

  exec "#{tempfile.path}"
end

task :default => [ :all_specs ]

RailsExample::Application.load_tasks
