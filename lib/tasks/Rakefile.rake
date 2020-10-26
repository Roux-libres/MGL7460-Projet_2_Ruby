# frozen_string_literal: true

require 'rubocop/rake_task'

task default: %i[test rubocop]

desc 'Run tests'
task(:test) do
  puts 'Hello world'
end

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new do |t|
    config_file = './lib/tasks/rubocop.yml'
    t.options = ['-c', config_file, '--fail-level', 'F']
  end
end

