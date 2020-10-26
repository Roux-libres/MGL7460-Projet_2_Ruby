# frozen_string_literal: true

require 'rubocop/rake_task'

task default: %i[rubocop test]

desc 'Run tests'
task(:test) do
  puts 'Hello world'
end

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new
end

