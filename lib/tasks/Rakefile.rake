# frozen_string_literal: true

require 'rubocop/rake_task'

desc 'Its new task for test'
task :print_test do
  puts 'Hello world'
end

RuboCop::RakeTask.new
